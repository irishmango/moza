import 'package:flutter/material.dart';
import 'package:moza/theme.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: AppColors.appOrange,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Interval Classes',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top intro
                  Text(
                    "Since the Renaissance, intervals have been divided into three classes. The three classes are based on the degree of tension within the interval. These three interval classes can help with an initial assessment of a musical work and are also associated with conventions in classical music.",
                    style: TextStyle(fontSize: 15, color: Colors.grey[900]),
                  ),
                  const SizedBox(height: 16),
                  // Section: Interval Classes
                  Text(
                    'Interval Classes',
                    style: TextStyle(
                      color: AppColors.appOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Perfect Consonances
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      children: [
                        const TextSpan(
                          text: 'Perfect Consonances (P1, P4, P5, P8):\n',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'On their own, they are vibrant, whether as chord major or minor, diatonic or chromatic, consonant or dissonant, or ambiguous or obscure. Some perfect consonances may also serve with some consequence, as a cadence, in the context of a key, or with other intervals. In the Renaissance, the perfect consonances were the only intervals considered stable.\n',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Imperfect Consonances
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      children: [
                        const TextSpan(
                          text: 'Imperfect Consonances (M3, m3, M6, m6):\n',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'These are less stable, but still useful, and they form an ideal basis for the overall polyphonic texture.\n',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Dissonances
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      children: [
                        const TextSpan(
                          text: 'Dissonances (M2, m2, M7, m7, tritone):\n',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Like imperfect consonances, dissonances have no standard forms in most contexts.\n',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Special Case
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(fontSize: 15, color: Colors.black),
                      children: [
                        const TextSpan(
                          text: 'Special Case – 4th:\n',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        TextSpan(
                          text: 'The fourth occupies a special position among intervals. It can be considered consonant or dissonant depending on how it is delivered. Often the fourth is found as a suspension in the final position, or as a result of voice leading. As a harmonic interval, the fourth is usually dissonant in the Renaissance. In vocal writing, the fourth is allowed under certain conditions.\n',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Table image
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Image.asset(
                      'assets/img/intervals/intervals_1.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Table: Interval Classes and their auditory behaviors',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(height: 16),
                  // Recap section
                  Text(
                    'Recap - Simple Intervals (Basic Forms)',
                    style: TextStyle(
                      color: AppColors.appOrange,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'It would be convenient that the other basic qualities all start on the same foundation.',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'The more an interval is divided from Latin ordinal numbers (1st, 2nd, etc.), the more dissonant it is.',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'The interval of seventh (7th) is an exception in that context. There is a succession by perfect intervals, in these basic forms. The distance of 5 semitones is referred to as tritone.',
                    style: TextStyle(fontSize: 15, color: Colors.black),
                  ),
                  const SizedBox(height: 8),
                  // Chart image placeholder
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    height: 120,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Text(
                        'Chart: Simple Intervals',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: FilledButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: FilledButton.styleFrom(
                            backgroundColor: AppColors.appOrange,
                          ),
                          child: const Text('Finish'),
                        ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}