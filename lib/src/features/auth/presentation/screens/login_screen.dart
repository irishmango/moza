import 'package:flutter/material.dart';
import 'package:moza/src/features/auth/presentation/screens/registration/registration_screen.dart';
import 'package:moza/src/features/auth/presentation/widgets/login_card.dart';
import 'package:moza/src/features/auth/presentation/widgets/third_party_login_button.dart';
import 'package:moza/src/features/dashboard/presentation/screens/dashboard.dart';
import 'package:moza/src/models/auth_repository.dart';
import 'package:moza/src/models/mock_database_repository.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moza/theme.dart';

class LoginScreen extends StatefulWidget {
  final AuthRepository auth;

  LoginScreen(this.auth, {super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final db = MockDatabaseRepository();
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 150),
            const Text("Welcome to MOZA!", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, height: 1)),
            const SizedBox(height: 12),
            const Text("Login to your\naccount", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, height: 1)),
            const SizedBox(height: 12),
            LoginCard(widget.auth),
            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 80),
              child: Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("Or", style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey, thickness: 1)),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: SizedBox(
                child: Column(
                  children: [
                    ThirdPartyLoginButton(
                      icon: FontAwesomeIcons.google,
                      text: "Sign in with Google",
                      onPressed: () async {
                        try {
                          await widget.auth.signInWithGoogle();
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => Dashboard(widget.auth, db: db)),
                          );
                        } catch (e) {
                          debugPrint('Google sign-in failed: $e');
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Login failed. Please try again.')),
                          );
                        }
                      },
                    ),
                    ThirdPartyLoginButton(
                      icon: FontAwesomeIcons.apple,
                      text: "Sign in with Apple",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Dashboard(widget.auth, db: db)),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => RegistrationScreen(widget.auth)),
                  );
                },
                child: RichText(
                  text: TextSpan(
                    text: "No account yet? Create one here",
                    style: TextStyle(
                      color: AppColors.appBlue,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.appBlue,
                      decorationThickness: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}