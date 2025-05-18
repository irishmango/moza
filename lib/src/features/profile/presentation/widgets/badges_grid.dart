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

  @override
  Widget build(BuildContext context) {
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
          );
        },
      ),
    );
  }
}

class BadgeTile extends StatelessWidget {
  final String? imagePath;

  const BadgeTile({super.key, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
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
                  child: Image.asset("assets/badges/badge_2.png",
                    width: 32,
                    color: Colors.grey.withAlpha(127),
                  ),
                ),
        ),
      ),
    );
  }
}