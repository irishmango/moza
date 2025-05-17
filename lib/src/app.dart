import 'package:flutter/material.dart';
import 'package:moza/src/features/auth/presentation/screens/login_screen.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/theme.dart';


class App extends StatelessWidget {
  // Attribute
  final DatabaseRepository db;

  // Konstruktor
  const App(this.db, {super.key});

  // Methode(n)
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: primaryTheme,
      home: LoginScreen(),
    );
  }
}