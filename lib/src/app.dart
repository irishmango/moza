import 'package:flutter/material.dart';
import 'package:moza/src/features/auth/presentation/screens/login_screen.dart';
import 'package:moza/src/models/auth_repository.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/src/models/firebase_auth_repository.dart';
import 'package:moza/theme.dart';


class App extends StatelessWidget {
  // Attribute
  final DatabaseRepository db;
  final AuthRepository auth;

  // Konstruktor
  App(this.db, this.auth, {super.key});

  // Methode(n)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: primaryTheme,
      home: LoginScreen(auth),
    );
  }
}