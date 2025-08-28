import 'package:flutter/material.dart';
import 'package:moza/src/features/auth/presentation/screens/login_screen.dart';
import 'package:moza/theme.dart';
import 'package:moza/src/features/chapters/presentation/screens/chapter_screen.dart';


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