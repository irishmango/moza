import 'package:flutter/material.dart';
import 'package:moza/src/features/dashboard/presentation/widgets/dashboard_app_bar.dart';
import 'package:moza/src/features/dashboard/presentation/widgets/learn_path_card.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/src/shared/header_expand.dart';
import 'package:moza/src/features/topics/presentation/screens/topics_screen.dart';
import 'package:moza/src/features/topics/presentation/widgets/topics_grid.dart';

class Dashboard extends StatelessWidget {
  final DatabaseRepository db;

  const Dashboard({
    required this.db,
    super.key});

  

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DashboardAppBar(),
              SizedBox(height: 24,),
              LearnPathCard(),
              SizedBox(height: 20,),

              HeaderExpand(title: "Topics to learn", path: TopicsScreen(db: db,)),

              TopicsGrid(limit: 4, scrollable: false, db: db,)
        
            ],
          ),
        ),
      ),
    );
  }
}
