import 'package:flutter/material.dart';
import 'package:moza/src/features/profile/presentation/widgets/badges_grid.dart';
import 'package:moza/src/features/settings/presentation/screens/settings_screen.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/src/shared/screen_header.dart';
import 'package:moza/src/shared/xp_tile.dart';
import 'package:moza/theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ScreenHeader(title: "Profile", trailingIcon: Icons.settings, onTrailingIconPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (ctx) => SettingsScreen()));
                },),
                SizedBox(height: 6),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 71,
                      backgroundImage: AssetImage('assets/img/avatar_profile.png'),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Shokri Francis",
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    SizedBox(height: 16),
                    XPTile(),
                    SizedBox(height: 25),

                    // Badges container
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        color: AppColors.appRed.withAlpha(120),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Text(
                              "My Badges",
                              style: TextStyle(
                                color: AppColors.appWhite,
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),

                          // Badges Grid
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: BadgesGrid(),
                          ),
                          SizedBox(height: 16),
                        ],
                      ),
                    ),
                    SizedBox(height: 12),

                    
                    Container(
                      width: double.infinity,
                      height: 420,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        color: AppColors.appGreen.withAlpha(120),
                      ),
                      child: Column(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
