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
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      
      width: double.infinity,
      height: 194,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
            boxShadow: [BoxShadow(
              color: Colors.black.withValues(alpha: 0.5),
              offset: Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 4,
            )
            ],
        color: AppColors.appBlue,
      ),
      
      
      child: Padding(
        padding: const EdgeInsets.all(20.0), 
        child: Stack(
          children: [Positioned(
            child: SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Row(
                    children: [
                       SizedBox(
                        width: 280,
                         child: Text(
                          chapter.title,
                          style: TextStyle(
                            height: 1,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: AppColors.appWhite,
                          ),
                                               ),
                       ),
                    ],
                  ),
                  SizedBox(height: 8,),
              
                  Row(
                    children: [
                      SizedBox(
                        width: 280,
                        child: Text(chapter.description, style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.appWhite), )),
                    ],
                  ),
                  Expanded(child: SizedBox()),
              
                  // Inner Info Row
                  Row(
                    children: [
                      Text("Complete for 85 XP Points", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.appWhite)),
                    ],
                  ),
              
                    ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 6,
            child: Image.asset('assets/img/moza_logo_yellow.png', width: 80,))
          ]
        )
      )
        );
  }
}