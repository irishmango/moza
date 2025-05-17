import 'package:flutter/material.dart';
import 'package:moza/theme.dart';

class TopicTile extends StatelessWidget {
  final String title;
  final Color color;
  final Function() path;

  const TopicTile({required this.title, required this.color, required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (ctx) => path()
        ));
      },
      child: GridTile(
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 20, 12, 12),
          width: double.infinity,
          height: 170,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [BoxShadow(
              color: Colors.black.withAlpha(50),
              offset: Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 4,
            )
            ],
          ),
         child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    width: 162,
                    child: Text(title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      height: 1.2
                    ),),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    (color == AppColors.appOrange || color == AppColors.appGreen || color == AppColors.appRed) 
                        ? 'assets/img/moza_logo_white.png'
                        : 'assets/img/moza_logo_yellow.png',
                    width: 65,
                    height: 65,
                  ),
                )
              ]
            ),
          ) 
        )
        );
  }
}