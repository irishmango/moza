import 'package:flutter/material.dart';

class BadgesGrid extends StatelessWidget {
  BadgesGrid({super.key});

  final List<String?> badgeImagePaths = [
    "assets/badges/badge_1.png",
    "assets/badges/badge_2.png",
    "assets/badges/badge_3.png",
    "assets/badges/badge_4.png",
    "assets/badges/badge_5.png",
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  ];

  final Map<String, Map<String, String>> badgeDescriptions = {
    "Interval Master": {
      "description": "You know your intervals like the back of your hand.",
      "imagePath": "assets/badges/badge_1.png"
    },
    "Music Theory 101 Master": {
      "description": "You have mastered the basics of music theory.",
      "imagePath": "assets/badges/badge_2.png"
    },
    "Rhythm Guru": {
      "description": "Your timing is impeccable and your rhythm flawless.",
      "imagePath": "assets/badges/badge_3.png"
    },
    "Scale Scholar": {
      "description": "You can play scales in your sleep.",
      "imagePath": "assets/badges/badge_4.png"
    },
    "Chord Champion": {
      "description": "You can recognize any chord in a flash.",
      "imagePath": "assets/badges/badge_5.png"
    },
    "Ear Training Pro": {
      "description": "Your ears are as sharp as your mind.",
      "imagePath": "assets/badges/badge_1.png"
    },
    "Sight Reading Savant": {
      "description": "You read music faster than you read text.",
      "imagePath": "assets/badges/badge_2.png"
    },
    "Notation Ninja": {
      "description": "You know every symbol on the staff like the back of your hand.",
      "imagePath": "assets/badges/badge_3.png"
    },
    "Perfect Pitch Paladin": {
      "description": "You can identify notes without a reference pitch.",
      "imagePath": "assets/badges/badge_4.png"
    },
    "Melody Maven": {
      "description": "Your melodies are as memorable as they are magical.",
      "imagePath": "assets/badges/badge_5.png"
    },
    "Progression Pro": {
      "description": "You can navigate any chord progression effortlessly.",
      "imagePath": "assets/badges/badge_1.png"
    },
    "Tempo Titan": {
      "description": "You keep the beat like a metronome.",
      "imagePath": "assets/badges/badge_2.png"
    },
  };

  @override
  Widget build(BuildContext context) {
    final badgeTitles = badgeDescriptions.keys.toList();

    return SizedBox(
      height: 280,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemCount: badgeImagePaths.length,
        itemBuilder: (context, index) {
          return BadgeTile(
            imagePath: badgeImagePaths[index],
            badgeTitle: index < badgeTitles.length ? badgeTitles[index] : null,
            badgeDescriptions: badgeDescriptions,
          );
        },
      ),
    );
  }
}

class BadgeTile extends StatelessWidget {
  final String? imagePath;
  final String? badgeTitle;
  final Map<String, Map<String, String>> badgeDescriptions;

  const BadgeTile({
    super.key,
    this.imagePath,
    this.badgeTitle,
    required this.badgeDescriptions,
  });

  void _showBadgeDialog(BuildContext context, String? imagePath, String? badgeTitle) {
    bool isLocked = imagePath == null;

    final badgeData = badgeDescriptions[badgeTitle] ?? {
      "description": "Keep studying to unlock this badge!",
      "imagePath": "assets/badges/badge_2.png"
    };

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          backgroundColor: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close, color: Colors.black),
                  ),
                ),
                SizedBox(height: 8),
                Image.asset(
                  badgeData["imagePath"]!,
                  width: 60,
                  height: 60,
                  color: isLocked ? Colors.grey.withAlpha(153) : null,
                ),
                SizedBox(height: 16),
                Text(
                  badgeTitle ?? "Locked Badge",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  isLocked ? "Keep studying to unlock this badge!" : badgeData["description"]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showBadgeDialog(context, imagePath, badgeTitle);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(26),
              blurRadius: 4,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: imagePath != null
              ? Image.asset(
                  imagePath!,
                  fit: BoxFit.contain,
                  alignment: Alignment.center,
                )
              : Center(
                  child: Image.asset(
                    "assets/badges/badge_2.png",
                    width: 32,
                    color: Colors.grey.withAlpha(127),
                  ),
                ),
        ),
      ),
    );
  }
}