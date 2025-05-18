import 'package:flutter/material.dart';

class ThirdPartyLoginButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const ThirdPartyLoginButton({
    required this.icon,
    required this.text,
    required this.onPressed,
    super.key,
  });

  bool get isApple => text.toLowerCase().contains("apple");
  bool get isGoogle => text.toLowerCase().contains("google");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isApple ? Colors.black : Colors.white,
          foregroundColor: isApple ? Colors.white : Colors.grey[700],
          elevation: 0,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: isApple 
                ? BorderSide.none 
                : BorderSide(color: Colors.grey.withAlpha(76)),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            isGoogle 
                ? Image.asset(
                    'assets/icons/google_icon.png',
                    width: 22,
                    height: 22,
                  )
                : Icon(icon, size: 22, color: isApple ? Colors.white : null),
            const SizedBox(width: 12),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isApple ? Colors.white : Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}