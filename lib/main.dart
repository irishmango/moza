import 'package:flutter/material.dart';
import 'package:moza/features/auth/presentation/screens/login_screen.dart';


void main() {
  runApp(const MaterialApp(
    home: LoginScreen(),
  ));
}

class Sandbox extends StatelessWidget {
  const Sandbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sandbox"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Text")
      ),
    );
  }
}