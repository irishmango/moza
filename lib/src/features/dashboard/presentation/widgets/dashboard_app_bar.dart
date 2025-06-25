import 'package:flutter/material.dart';
import 'package:moza/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:moza/src/shared/xp_tile.dart';
import 'package:moza/theme.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ProfileScreen()));
          },
          child: Column(
            spacing: 8,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/img/avatar_profile.png'),
              ),
              XPTile()
            ],
          ),
        ),
        
        SizedBox(width: 4),
    
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("WELCOME BACK!", style: TextStyle(color: AppColors.textColor, fontSize: 28, fontWeight: FontWeight.w600),),
              Text("Shokri Francis", style: TextStyle(color: AppColors.textColor, fontSize: 28, fontWeight: FontWeight.bold),),
            ],
          ),
        ),
    
        SizedBox(width: 12),
    
        
      ],
    );
  }
}