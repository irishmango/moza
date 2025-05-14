import 'package:flutter/material.dart';

class ScreenHeader extends StatelessWidget {
  final String title;

  const ScreenHeader({
    required this.title,
    super.key,
  });

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
    
        // Second Container: Title (Centered)
        Expanded(
          flex: 3,
          child: Center(
            child: Container(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
    
        // Third Container: Empty (Fills Remaining Space)
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
  }
}