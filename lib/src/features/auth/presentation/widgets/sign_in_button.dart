import 'package:flutter/material.dart';
import 'package:moza/src/features/dashboard/presentation/screens/dashboard.dart';
import 'package:moza/src/models/mock_database_repository.dart';
import 'package:moza/theme.dart';

class SignInButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Map<String, String> testUser;

  const SignInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.testUser,
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
          final enteredEmail = emailController.text.trim();
          final enteredPassword = passwordController.text;

          final isAuthenticated =
              enteredEmail == testUser['email'] &&
              enteredPassword == testUser['password'];

          if (isAuthenticated) {
            final db = MockDatabaseRepository();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Dashboard(db: db),
              ),
            );
          } else {
            final snackBar = SnackBar(
              content: const Text(
                'Invalid credentials.',
                style: TextStyle(fontSize: 16),
              ),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
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