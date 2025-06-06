import 'package:flutter/material.dart';
import 'package:moza/src/features/auth/presentation/screens/registration/registration_screen.dart';
import 'package:moza/src/features/auth/presentation/widgets/login_card.dart';
import 'package:moza/src/features/auth/presentation/widgets/third_party_login_button.dart';
import 'package:moza/src/features/dashboard/presentation/screens/dashboard.dart';
import 'package:moza/src/models/mock_database_repository.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:moza/theme.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final db = MockDatabaseRepository();
    return CustomScaffold(
      body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150,),
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
                      spacing: 6,
                      children: [
                        ThirdPartyLoginButton(icon: FontAwesomeIcons.google, text: "Sign in with Google", 
                        onPressed: () {
                          
                          Navigator.of(context).push(
                            MaterialPageRoute(
                            builder: (context) => Dashboard(db: db,)));
                        },
                        ),
                        ThirdPartyLoginButton(icon: FontAwesomeIcons.apple, text: "Sign in with Apple", 
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                            builder: (context) => Dashboard(db: db,)));
                        },)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24,),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (ctx) => RegistrationScreen()),
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