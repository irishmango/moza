import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // 👈
import 'package:moza/src/features/dashboard/presentation/screens/dashboard.dart';
import 'package:moza/src/models/auth_repository.dart';
import 'package:moza/src/models/database_repository.dart';
import 'package:moza/theme.dart';

class SignInButton extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  bool isValidEmail(String email) {
    final regex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+$",
    );
    return regex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    // Get repos from Provider
    final auth = context.read<AuthRepository>();
    final db   = context.read<DatabaseRepository>();

    return Container(
      width: 190,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        color: AppColors.appOrange,
      ),
      child: TextButton(
        onPressed: () async {
          final enteredEmail = emailController.text.trim();
          final enteredPassword = passwordController.text;

          if (!isValidEmail(enteredEmail)) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Please enter a valid email address.',
                  style: TextStyle(fontSize: 16),
                ),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 2),
              ),
            );
            return;
          }

          try {
            await auth.signInWithEmailAndPassword(enteredEmail, enteredPassword);

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const Dashboard()),
            );
          } on FirebaseAuthException catch (e) {
            String error;
            switch (e.code) {
              case 'user-not-found':
              case 'wrong-password':
                error = 'No account found with that email and password.';
                break;
              case 'invalid-email':
                error = 'The email address is not valid.';
                break;
              case 'user-disabled':
                error = 'This account has been disabled.';
                break;
              case 'email-not-verified':
                error = 'Please verify your email before logging in.';
                break;
              default:
                error = 'Authentication failed. Please try again.';
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(error, style: const TextStyle(fontSize: 16)),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 2),
              ),
            );
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