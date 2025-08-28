import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moza/src/app.dart';
import 'package:moza/src/models/auth_repository.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/src/models/firebase_auth_repository.dart';
import 'package:moza/src/models/mock_database_repository.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Choose between Firestore-backed repo or mock repo
  final DatabaseRepository db = MockDatabaseRepository(); 
  // For real Firestore: final DatabaseRepository db = FirestoreDatabaseRepository();

  final AuthRepository auth = FirebaseAuthRepository();
  
  runApp(
    MultiProvider(
      providers: [
        Provider<DatabaseRepository>.value(value: db),
        Provider<AuthRepository>.value(value: auth),
      ],
      child: App(),
    ),
  );
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    // Example: accessing provider
    final db = Provider.of<DatabaseRepository>(context, listen: false);
    return CustomScaffold(
      body: Text("Sandbox using $db"),
    );
  }
}