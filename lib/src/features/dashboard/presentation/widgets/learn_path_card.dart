import 'package:flutter/material.dart';
import 'package:moza/src/shared/learn_path_provider.dart';
import 'package:moza/src/shared/open_card_button.dart';
import 'package:moza/theme.dart';
import 'package:provider/provider.dart';

class LearnPathCard extends StatelessWidget {
  const LearnPathCard({super.key});

  @override
  Widget build(BuildContext context) {
    final lastTitle = context.watch<LearnPath>().lastChapterTitle;
    final hasTitle = (lastTitle != null && lastTitle.isNotEmpty);

    return Container(
      width: double.infinity,
      height: 194,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 4,
          )
        ],
        gradient: const LinearGradient(
          colors: [Color(0xFF58B270), Color.fromARGB(255, 126, 213, 149)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "My Learn Path",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                OpenCardButton(
                  color: const Color(0xFF317C43),
                  onPressed: () {
                    // TODO: add more information about user
                    if (!hasTitle) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('No recent chapter yet.')),
                      );
                    }
                  },
                )
              ],
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (!hasTitle) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No recent chapter yet.')),
                  );
                  return;
                }
                // TODO: Navigate to the saved chapter using the stored variable
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF44AE61),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hasTitle ? "Continue with..." : "Continue with…",
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            hasTitle ? lastTitle : "Get started!",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                      height: 50,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              strokeCap: StrokeCap.round,
                              value: 0.1,
                              strokeWidth: 5,
                              backgroundColor: Colors.transparent,
                              valueColor: AlwaysStoppedAnimation<Color>(AppColors.appOrange),
                            ),
                          ),
                          const Center(
                            child: Text(
                              "0%",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}