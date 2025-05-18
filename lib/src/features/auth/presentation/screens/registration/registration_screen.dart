import 'package:flutter/material.dart';
import 'package:moza/src/features/auth/presentation/screens/login_screen.dart';
import 'package:moza/src/features/auth/presentation/widgets/reg_button.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/theme.dart';

enum RegistrationStep { firstName, lastName, email, confirmation }

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _controller = TextEditingController();
  RegistrationStep _currentStep = RegistrationStep.firstName;
  bool _isButtonEnabled = false;

  void _onTextChanged() {
    setState(() {
      _isButtonEnabled = _controller.text.trim().isNotEmpty;
    });
  }

  void _nextStep() {
    if (!_isButtonEnabled) return;

    setState(() {
      _isButtonEnabled = false;
      _controller.clear(); 

      if (_currentStep == RegistrationStep.firstName) {
        _currentStep = RegistrationStep.lastName;
      } else if (_currentStep == RegistrationStep.lastName) {
        _currentStep = RegistrationStep.email;
      } else if (_currentStep == RegistrationStep.email) {
        _currentStep = RegistrationStep.confirmation;
      }
    });
  }

  String _getLabelText() {
    switch (_currentStep) {
      case RegistrationStep.firstName:
        return "Enter your first name";
      case RegistrationStep.lastName:
        return "Enter your last name";
      case RegistrationStep.email:
        return "Enter your email";
      case RegistrationStep.confirmation:
        return "";
    }
  }

  Icon? _getIcon() {
    switch (_currentStep) {
      case RegistrationStep.firstName:
        return const Icon(Icons.person);
      case RegistrationStep.lastName:
        return const Icon(Icons.person_outline);
      case RegistrationStep.email:
        return const Icon(Icons.email_outlined);
      case RegistrationStep.confirmation:
        return null;
    }
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Stack(
          children: [
            /// Main Content - Centered
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_currentStep == RegistrationStep.confirmation) ...[
                    const Text(
                      "Please check your email for a confirmation link.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ] else ...[
                    TextField(
                      controller: _controller,
                      cursorColor: AppColors.appOrange,
                      decoration: InputDecoration(
                        prefixIcon: _getIcon(),
                        labelText: _getLabelText(),
                      ),
                    ),
                    const SizedBox(height: 28),
                    RegButton(
                      isEnabled: _isButtonEnabled,
                      onPressed: _nextStep,
                    ),
                  ],
                ],
              ),
            ),

            if (_currentStep != RegistrationStep.confirmation)
            Positioned(
              bottom: 30,  
              left: 0,
              right: 0,
              child: Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => LoginScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? Click here",
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
            ),
          ],
        ),
      ),
    );
  }
}