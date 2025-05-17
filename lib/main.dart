import 'package:flutter/material.dart';
import 'package:moza/src/app.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/src/models/mock_database_repository.dart';


void main() {
  final DatabaseRepository db = MockDatabaseRepository();
  runApp(App(db),
  );
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