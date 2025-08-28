import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart'; // 👈 add this
import 'package:moza/src/features/auth/presentation/widgets/sign_in_button.dart';
import 'package:moza/src/models/auth_repository.dart';
import 'package:moza/theme.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({super.key}); // 👈 no more auth in ctor

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  bool isObscured = true;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Grab auth from Provider
    final auth = context.read<AuthRepository>();

    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                color: AppColors.appBlue,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(color: const Color(0x19000000), blurRadius: 22, offset: const Offset(0, 10)),
                  BoxShadow(color: const Color(0x16000000), blurRadius: 40, offset: const Offset(0, 40)),
                  BoxShadow(color: const Color(0x0C000000), blurRadius: 55, offset: const Offset(0, 91)),
                  BoxShadow(color: const Color(0x02000000), blurRadius: 65, offset: const Offset(0, 162)),
                  BoxShadow(color: const Color(0x00000000), blurRadius: 71, offset: const Offset(0, 253)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your Email", style: TextStyle(color: AppColors.appWhite, fontSize: 20)),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 42,
                    child: TextField(
                      controller: _emailController,
                      cursorColor: Colors.grey,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 16, top: 14),
                        hintText: "Enter Your Email",
                        hintStyle: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: Colors.grey.withAlpha(100),
                            fontSize: 16,
                          ),
                        ),
                        filled: true,
                        fillColor: AppColors.appWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text("Password", style: TextStyle(color: AppColors.appWhite, fontSize: 20)),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 42,
                    child: TextField(
                      controller: _passwordController,
                      cursorColor: Colors.grey,
                      obscureText: isObscured,
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 16, top: 14),
                        hintText: "Enter Your Password",
                        hintStyle: TextStyle(color: Colors.grey.withAlpha(100), fontSize: 16),
                        filled: true,
                        fillColor: AppColors.appWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscured ? Icons.visibility_off : Icons.visibility,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscured = !isObscured;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 25),
        Center(
          child: SignInButton(
            emailController: _emailController,
            passwordController: _passwordController,
          ),
        ),
      ],
    );
  }
}