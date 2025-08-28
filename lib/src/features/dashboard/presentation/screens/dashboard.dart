import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 👈 add this

import 'package:moza/src/features/dashboard/presentation/widgets/dashboard_app_bar.dart';
import 'package:moza/src/features/dashboard/presentation/widgets/learn_path_card.dart';
import 'package:moza/src/features/dashboard/presentation/widgets/quiz_time_card.dart';
import 'package:moza/src/models/auth_repository.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/src/shared/header_expand.dart';
import 'package:moza/src/features/topics/presentation/screens/topics_screen.dart';
import 'package:moza/src/features/topics/presentation/widgets/topics_grid.dart';
import 'package:moza/src/features/topics/domain/topic.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key}); // 👈 no args

  @override
  Widget build(BuildContext context) {
    // Pull repos from Provider
    final auth = context.read<AuthRepository>();
    final db   = context.read<DatabaseRepository>();

    return CustomScaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                DashboardAppBar(), // still passes auth (or refactor this widget too)
                const SizedBox(height: 24),
                const LearnPathCard(),
                const SizedBox(height: 20),

                // Section header with link to Topics
                HeaderExpand(
                  title: "Topics to learn",
                  path: TopicsScreen(), // if you later refactor TopicsScreen to Provider, use: const TopicsScreen()
                ),

                // Topics preview
                FutureBuilder<List<Topic>>(
                  future: db.getAllTopics(),
                  builder: (context, snapshot) {
                    final isLoading = snapshot.connectionState == ConnectionState.waiting;
                    final hasError  = snapshot.hasError;
                    final topics    = snapshot.data ?? const <Topic>[];

                    if (isLoading) {
                      return const SizedBox(
                        height: 220,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    if (hasError) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Failed to load topics.',
                          style: TextStyle(color: Colors.red),
                        ),
                      );
                    }

                    if (topics.isEmpty) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text('No topics yet.'),
                      );
                    }

                    return TopicsGrid(
                      limit: 4,
                      scrollable: false,
                      topics: topics,
                    );
                  },
                ),

                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Improvement Area',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 8),
                const QuizTimeCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}