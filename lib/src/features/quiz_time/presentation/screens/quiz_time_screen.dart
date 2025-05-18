import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:moza/src/features/quiz_time/presentation/widgets/quiz_wheel.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/src/shared/screen_header.dart';

class QuizTimeScreen extends StatefulWidget {
  const QuizTimeScreen({super.key});

  @override
  State<QuizTimeScreen> createState() => _QuizTimeScreenState();
}

class _QuizTimeScreenState extends State<QuizTimeScreen> {
  final List<String> topics = [
    "Cadences",
    "Chords",
    "Scales",
    "Music 101",
    "Analysis",
    "Modulation",
    "Intervals",
  ];

  List<String> filteredTopics = [];

  late StreamController<int> controller;

  @override
  void initState() {
    super.initState();
    controller = StreamController<int>();
  }

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  void _spinWheel() {
    if (filteredTopics.isEmpty) {
      return;
    }
    final randomIndex = Random().nextInt(filteredTopics.length);
    controller.add(randomIndex);
  }

  void _openFilterDialog() {
  showDialog(
    context: context,
    builder: (context) {
      List<bool> selectedTopics = filteredTopics.isEmpty 
          ? List.filled(topics.length, true) 
          : topics.map((e) => filteredTopics.contains(e)).toList();

      bool selectAll = selectedTopics.every((selected) => selected);

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text("Filter Topics"),
            content: SizedBox(
              width: double.maxFinite,
              child: ListView(
                shrinkWrap: true,
                children: [
                  CheckboxListTile(
                    title: const Text("All Topics"),
                    value: selectAll,
                    onChanged: (value) {
                      setState(() {
                        selectAll = value!;
                        selectedTopics = List.filled(topics.length, selectAll);
                      });
                    },
                  ),
                  ...List.generate(topics.length, (index) {
                    return CheckboxListTile(
                      title: Text(topics[index]),
                      value: selectedTopics[index],
                      onChanged: (value) {
                        setState(() {
                          selectedTopics[index] = value!;
                          selectAll = selectedTopics.every((selected) => selected);
                        });
                      },
                    );
                  }),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    filteredTopics = [
                      for (int i = 0; i < topics.length; i++)
                        if (selectedTopics[i]) topics[i]
                    ].toList(); 
                    print("Updated filteredTopics: $filteredTopics");
                  });

                  Navigator.pop(context);
                },
                child: const Text("Apply"),
              ),
            ],
          );
        },
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return CustomScaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ScreenHeader(
                    title: "Quiz Time!",
                    trailingIcon: Icons.tune,
                    onTrailingIconPressed: _openFilterDialog
                  ),
                  const SizedBox(height: 150),

                  Text(
                    "Spin to Learn",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Randomly check your knowledge",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),

                  const SizedBox(height: 30),

                  ElevatedButton(
                    onPressed: _spinWheel,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Spin!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Spinnable Wheel
          Positioned(
            bottom: -screenHeight * 0.3,
            left: -screenHeight * 0.1,
            right: -screenHeight * 0.1,
            child: Center(
              child: QuizWheel(controller: controller, topics: filteredTopics.isEmpty ? topics : filteredTopics),
            ),
          ),
        ],
      ),
    );
  }
}
