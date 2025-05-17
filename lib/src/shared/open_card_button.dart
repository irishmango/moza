import 'package:flutter/material.dart';


class OpenCardButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;
  

  const OpenCardButton({
    required this.color,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Center(
        child: IconButton(onPressed: () {
          onPressed();
        }, 
        icon: Icon(
          Icons.arrow_outward,
          color: Colors.white,
        ),)
        
      ),
    );
  }
}