import 'package:flutter/material.dart';
import 'package:moza/shared/custom_scaffold.dart';
import 'package:moza/features/topics/presentation/widgets/topics_grid.dart';
import 'package:moza/shared/screen_header.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({super.key});

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


                TopicsGrid(scrollable: false,)
              ],
            ),
            )),
      ),
    );
  }
}
