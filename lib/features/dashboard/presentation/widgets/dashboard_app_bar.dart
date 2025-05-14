import 'package:flutter/material.dart';
import 'package:moza/shared/xp_tile.dart';
import 'package:moza/theme.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('assets/img/avatar_profile.png'),
        ),
        
        Expanded(child: SizedBox()),
    
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("WELCOME BACK!", style: TextStyle(color: AppColors.textColor, fontSize: 20, fontWeight: FontWeight.w600),),
            Text("Shokri Francis", style: TextStyle(color: AppColors.textColor, fontSize: 20, fontWeight: FontWeight.bold),),
          ],
        ),
    
        Expanded(child: SizedBox()),
    
        XPTile()
      ],
    );
  }
}