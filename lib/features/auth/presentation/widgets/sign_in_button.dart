import 'package:flutter/material.dart';
import 'package:moza/features/dashboard/presentation/screens/dashboard.dart';
import 'package:moza/theme.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        color: AppColors.appOrange,
      ),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
            builder: (context) => Dashboard()));
        },
        child: Text(
          "Sign In",
          style: TextStyle(
            color: AppColors.appWhite,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}