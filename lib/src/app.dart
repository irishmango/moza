import 'package:flutter/material.dart';
import 'package:moza/main.dart';
import 'package:moza/src/features/auth/presentation/screens/login_screen.dart';
import 'package:moza/src/models/auth_repository.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/src/models/firebase_auth_repository.dart';
import 'package:moza/theme.dart';


class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: primaryTheme,
      home: LoginScreen(),
    );
  }
}