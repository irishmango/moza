import 'package:flutter/material.dart';
import 'package:moza/theme.dart';

class ScreenHeader extends StatelessWidget {
  final String title;
  final IconData? trailingIcon;
  final VoidCallback? onTrailingIconPressed;

  const ScreenHeader({
    required this.title,
    this.trailingIcon,
    this.onTrailingIconPressed,
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
            child: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.chevron_left_rounded, size: 54),
            ),
          ),
        ),
    
        // Second Container: Title (Centered)
        Expanded(
          flex: 8,
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
    
        // Third Container: Optional Icon
        Expanded(
          flex: 1,
          child: trailingIcon != null 
            ? Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(trailingIcon, size: 28, color: Colors.grey[700],),
                  onPressed: onTrailingIconPressed,
                ),
              )
            : const SizedBox(),
        ),
      ],
    );
  }
}