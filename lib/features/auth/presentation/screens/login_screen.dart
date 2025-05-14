import 'package:flutter/material.dart';
import 'package:moza/features/auth/presentation/screens/registration/registration_screen.dart';
import 'package:moza/features/auth/presentation/widgets/login_card.dart';
import 'package:moza/shared/custom_scaffold.dart';
import 'package:moza/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200,),
                Text("Welcome to MOZA!", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, height: 1),),
                SizedBox(height: 12,),
                Text("Login to your\naccount", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, height: 1)),
                SizedBox(height: 12),
                LoginCard(),
                SizedBox(height: 25,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                        children: [
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "Or",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Colors.grey,
                              thickness: 1,
                            ),
                          ),
                        ],
                      )
                ),
                SizedBox(height: 25,),
                Center(
                  child: SizedBox(
                    child: Column(
                      children: [
                        
                        // SignInButton(Buttons.google, onPressed: () {}),
                        // SignInButton(Buttons.apple, onPressed: () {}), 
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24,),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (ctx) => RegistrationScreen()));
                    },
                    child: Text("Create your account here", style: TextStyle(color: AppColors.appBlue, decoration: TextDecoration.underline),
                    
                    )),
                )
                           
              ],
            ),
          ),
    );
  }
}