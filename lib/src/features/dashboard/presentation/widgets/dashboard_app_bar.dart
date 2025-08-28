import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 👈
import 'package:moza/src/features/profile/presentation/screens/profile_screen.dart';
import 'package:moza/src/models/auth_repository.dart';
import 'package:moza/src/shared/xp_tile.dart';
import 'package:moza/theme.dart';

class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({super.key}); // 👈 no more auth in ctor

  @override
  Widget build(BuildContext context) {
    final auth = context.read<AuthRepository>();

    return Row(
      spacing: 8,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => ProfileScreen(auth)),
            );
          },
          child: Column(
            spacing: 8,
            children: const [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/img/avatar_profile.png'),
              ),
              XPTile(),
            ],
          ),
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "WELCOME BACK!",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Shokri Francis",
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}