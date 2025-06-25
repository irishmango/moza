import 'package:flutter/material.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/src/features/topics/presentation/widgets/topics_grid.dart';
import 'package:moza/src/shared/screen_header.dart';

class TopicsScreen extends StatelessWidget {
  final DatabaseRepository db;
  
  const TopicsScreen({
    required this.db,
    super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                ScreenHeader(title: "Topics",),
              
              
                const SizedBox(height: 16),


                TopicsGrid(scrollable: true, db: db,)
              ],
            ),
            )),
      ),
    );
  }
}
