import 'package:flutter/material.dart';

class TopicMainCard extends StatelessWidget {
  const TopicMainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      // Container Style
      width: double.infinity,
      height: 194,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
            boxShadow: [BoxShadow(
              color: Colors.black.withAlpha(50),
              offset: Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 4,
            )
            ],
        gradient: const LinearGradient(
          colors: [Color(0xFF58B270), Color.fromARGB(255, 126, 213, 149)],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Main padding in the card
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Title Row
            Row(
              children: [
                Expanded(
                  child: const Text(
                    "Harmony & Chord Theory",
                    style: TextStyle(
                      height: 1,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Text("• Complete this course to get 380XP", style: TextStyle(fontWeight: FontWeight.w600),),
              ],
            ),

            // Inner Info Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 132,
                  height: 44,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white.withAlpha(150),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text Column
                      Text(
                        "2 Hrs 15 Mins",
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}