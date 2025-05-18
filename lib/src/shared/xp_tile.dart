import 'package:flutter/material.dart';


class XPTile extends StatelessWidget {
  // TODO 1: Accept XP points from database storage
  const XPTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(5), bottomLeft: Radius.circular(5), bottomRight: Radius.circular(16)),
        gradient:LinearGradient(
          begin: Alignment(0.00, 0.50),
          end: Alignment(1.79, 0.52),
          colors: [const Color(0xFFFF6B1B), const Color(0xFFFFE549)],
                )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.diamond_outlined, color: Colors.black,),
          SizedBox(width: 6),
          Text("8300XP", style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),),
    
        ],
      ),
    );
  }
}