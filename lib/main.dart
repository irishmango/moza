import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moza/src/app.dart';
import 'package:moza/src/models/auth_repository.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/src/models/firebase_auth_repository.dart';
import 'package:moza/src/models/firestore_repository.dart';
import 'package:moza/src/shared/learn_path_provider.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final DatabaseRepository db = FirestoreRepository();
  final AuthRepository auth = FirebaseAuthRepository();

  runApp(
    MultiProvider(
      providers: [
        Provider<DatabaseRepository>.value(value: db),
        Provider<AuthRepository>.value(value: auth),

        // ADD THIS:
        ChangeNotifierProvider<LearnPath>(create: (_) => LearnPath()),
      ],
      child: App(),
    ),
  );
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  // migration code. PLEASE WORK :( )
  static const String kTopicsCol = 'topics';
  static const String kMiddleSub = 'chapters';   // correct middle level
  static const String kWrongDeep = 'chapters';   // WRONG deepest name
  static const String kRightDeep = 'lessons';    // NEW deepest name
  static const String kDocTitle = 'Intervals Classes';
  static const List<String> kSubcollectionsToCopy = <String>['blocks'];
  static const bool kDeleteOldAfterCopy = false; // becomes true after verufying

  Future<void> _migrateData() async {
    final fs = FirebaseFirestore.instance;

    // Iterate all topics
    final topicsSnap = await fs.collection(kTopicsCol).get();
    for (final topic in topicsSnap.docs) {
      final chaptersRef = topic.reference.collection(kMiddleSub);
      final chaptersSnap = await chaptersRef.get();

      // Iterate each chapter under the topic
      for (final chapter in chaptersSnap.docs) {
        final wrongRef = chapter.reference.collection(kWrongDeep);
        final rightRef = chapter.reference.collection(kRightDeep);

        // Only docs where title == "Interval Classes"
        final wrongSnap =
            await wrongRef.where('title', isEqualTo: kDocTitle).get();

        if (wrongSnap.docs.isEmpty) {
          debugPrint('[SKIP] ${topic.id}/${chapter.id} — no "$kDocTitle" in "$kWrongDeep"');
          continue;
        }

        debugPrint('[COPY] ${topic.id}/${chapter.id}: moving "$kDocTitle" -> "$kRightDeep"');

        // Copy the lesson docs
        WriteBatch batch = fs.batch();
        int ops = 0;
        for (final doc in wrongSnap.docs) {
          batch.set(rightRef.doc(doc.id), doc.data());
          ops++;
        }
        if (ops > 0) await batch.commit();

        // Copy specified subcollections ('blocks')
        for (final doc in wrongSnap.docs) {
          final srcDoc = doc.reference;
          final dstDoc = rightRef.doc(doc.id);

          for (final subName in kSubcollectionsToCopy) {
            final subSnap = await srcDoc.collection(subName).get();
            if (subSnap.docs.isEmpty) continue;

            WriteBatch subBatch = fs.batch();
            int subOps = 0;

            for (final subDoc in subSnap.docs) {
              subBatch.set(
                dstDoc.collection(subName).doc(subDoc.id),
                subDoc.data(),
              );
              subOps++;
            }
            if (subOps > 0) await subBatch.commit();
          }
        }
      }
    }

    debugPrint('Migration finished (filtered to "$kDocTitle" + its blocks).');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              try {
                await _migrateData();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Migration completed ')),
                );
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Migration failed: $e')),
                );
              }
            },
            child: const Text('Run Migration'),
          ),
        ),
      ),
    );
  }
}