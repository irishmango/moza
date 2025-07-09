import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moza/src/app.dart';
import 'package:moza/src/models/auth_repository.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/src/models/firebase_auth_repository.dart';
import 'package:moza/src/models/mock_database_repository.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'firebase_options.dart';


void main() async {
  final DatabaseRepository db = MockDatabaseRepository();

  WidgetsFlutterBinding.ensureInitialized(); 
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    final AuthRepository auth = FirebaseAuthRepository();
  
  runApp(App(db, auth),
  );
}





class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Text("Sandbox"),
    );
  }
}