// topics_screen.dart
import 'package:flutter/material.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/src/features/topics/presentation/widgets/topics_grid.dart';
import 'package:moza/src/shared/screen_header.dart';
import 'package:moza/src/features/topics/domain/topic.dart';

class TopicsScreen extends StatelessWidget {
  final DatabaseRepository db;

  const TopicsScreen({required this.db, super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: FutureBuilder<List<Topic>>(
        future: db.getAllTopics(),
        builder: (context, snapshot) {
          final isLoading = snapshot.connectionState == ConnectionState.waiting;
          final hasError  = snapshot.hasError;
          final topics    = snapshot.data ?? const <Topic>[];

          return Stack(
            children: [
              SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: [
                        const ScreenHeader(title: "Topics"),
                        const SizedBox(height: 16),
                        if (hasError)
                          Text('Error: ${snapshot.error}')
                        else if (topics.isEmpty && !isLoading)
                          const Text('No topics found.')
                        else
                          TopicsGrid(
                            topics: topics,       // <- pass data to grid
                            scrollable: true,
                          ),
                      ],
                    ),
                  ),
                ),
              ),

              // Loading overlay (sits on top of the background)
              if (isLoading)
                const IgnorePointer(
                  ignoring: true,
                  child: ColoredBox(
                    color: Colors.transparent, // or Colors.black12 for dim
                    child: Center(child: CircularProgressIndicator()),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}