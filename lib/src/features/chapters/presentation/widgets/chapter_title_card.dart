import 'package:flutter/material.dart';
import 'package:moza/src/features/chapters/domain/chapter.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/theme.dart';

class ChapterTitleCard extends StatelessWidget {
  final DatabaseRepository db;
  final Chapter chapter;

  const ChapterTitleCard({
    required this.db,
    required this.chapter,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.5),
            offset: const Offset(0, 4),
            spreadRadius: 0,
            blurRadius: 4,
          )
        ],
        color: AppColors.appBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            // Text content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, 
              children: [
                Text(
                  chapter.title,
                  style: TextStyle(
                    height: 1,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.appWhite,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 280,
                  child: Text(
                    chapter.description,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Complete for 85 XP Points",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),

            // Logo in bottom-right
            Positioned(
              bottom: 0,
              right: 6,
              child: Image.asset(
                'assets/img/moza_logo_yellow.png',
                width: 80,
              ),
            ),
          ],
        ),
      ),
    );
  }
}