import 'package:flutter/material.dart';
import 'package:moza/features/dashboard/presentation/widgets/dashboard_app_bar.dart';
import 'package:moza/features/dashboard/presentation/widgets/learn_path_card.dart';
import 'package:moza/placeholders/coming_soon.dart';
import 'package:moza/shared/custom_scaffold.dart';
import 'package:moza/shared/general_background.dart';
import 'package:moza/shared/header_expand.dart';
import 'package:moza/shared/xp_tile.dart';
import 'package:moza/theme.dart';
import 'package:moza/features/topics/presentation/screens/topics_screen.dart';
import 'package:moza/features/topics/presentation/widgets/topics_grid.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

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

              HeaderExpand(title: "Topics to learn", path: TopicsScreen()),

              TopicsGrid(limit: 4, scrollable: false,)
        
            ],
          ),
        ),
      ),
    );
  }
}
