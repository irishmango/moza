import 'package:flutter/material.dart';
import 'package:moza/theme.dart';


class ProgressBar extends StatelessWidget {
  const ProgressBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // First Container: Icon
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Navigator.pop(context);
                }, 
                icon: Icon(Icons.chevron_left_rounded, size: 54)),
            ),
          ),
        ),
    
        // Second Container: Progress Bar
        Expanded(
          flex: 4,
          child: Stack(
            alignment: Alignment.center,
            children: [
            Container(
              width: 240,
               height: 16,
               decoration: BoxDecoration(
                  color: AppColors.appOrange.withAlpha(85),
                   borderRadius: BorderRadius.circular(22))
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 50,
                height: 16,
                decoration: BoxDecoration(
                color: AppColors.appOrange,
                borderRadius: BorderRadius.circular(22))
              ),
            )
            ]
          ),
        ),
    
        // Third Container: Empty 
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
      
  }
}