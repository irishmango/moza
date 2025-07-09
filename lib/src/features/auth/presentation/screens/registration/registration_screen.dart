import 'package:flutter/material.dart';
import 'package:moza/src/features/auth/presentation/screens/login_screen.dart';
import 'package:moza/src/features/auth/presentation/widgets/reg_button.dart';
import 'package:moza/src/models/auth_repository.dart';
import 'package:moza/src/shared/custom_scaffold.dart';
import 'package:moza/theme.dart';

enum RegistrationStep { firstName, lastName, email, password, confirmation }

class RegistrationScreen extends StatefulWidget {
  final AuthRepository auth;
  const RegistrationScreen(this.auth, {super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  RegistrationStep _currentStep = RegistrationStep.firstName;

  bool _isButtonEnabled = false;
  String _firstName = '';
  String _lastName = '';
  String _email = '';
  String _password = '';

  void _onTextChanged() {
    setState(() {
      if (_currentStep == RegistrationStep.password) {
        _isButtonEnabled = _passwordController.text.isNotEmpty &&
            _confirmPasswordController.text.isNotEmpty &&
            _passwordController.text == _confirmPasswordController.text;
      } else {
        switch (_currentStep) {
          case RegistrationStep.firstName:
            _isButtonEnabled = _firstNameController.text.trim().isNotEmpty;
            break;
          case RegistrationStep.lastName:
            _isButtonEnabled = _lastNameController.text.trim().isNotEmpty;
            break;
          case RegistrationStep.email:
            _isButtonEnabled = _emailController.text.trim().isNotEmpty;
            break;
          default:
            _isButtonEnabled = false;
        }
      }
    });
  }

  void _nextStep() async {
    if (!_isButtonEnabled) return;

    setState(() => _isButtonEnabled = false);

    if (_currentStep == RegistrationStep.firstName) {
      _firstName = _firstNameController.text.trim();
      setState(() => _currentStep = RegistrationStep.lastName);
    } else if (_currentStep == RegistrationStep.lastName) {
      _lastName = _lastNameController.text.trim();
      setState(() => _currentStep = RegistrationStep.email);
    } else if (_currentStep == RegistrationStep.email) {
      _email = _emailController.text.trim();
      setState(() => _currentStep = RegistrationStep.password);
    } else if (_currentStep == RegistrationStep.password) {
      _password = _passwordController.text.trim();
      try {
        await widget.auth.registerUser(_email, _password, _firstName, _lastName);
        await widget.auth.sendVerificationEmail();
        setState(() => _currentStep = RegistrationStep.confirmation);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration failed: $e")),
        );
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _firstNameController.addListener(_onTextChanged);
    _lastNameController.addListener(_onTextChanged);
    _emailController.addListener(_onTextChanged);
    _passwordController.addListener(_onTextChanged);
    _confirmPasswordController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Stack(
          children: [
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
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) => LoginScreen(widget.auth),
                          ),
                        );
                      },
                      child: const Text(
                        "Back to Login",
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ] else ...[
                    StepInputField(
                      step: _currentStep,
                      firstNameController: _firstNameController,
                      lastNameController: _lastNameController,
                      emailController: _emailController,
                      passwordController: _passwordController,
                      confirmPasswordController: _confirmPasswordController,
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
                        MaterialPageRoute(builder: (ctx) => LoginScreen(widget.auth)),
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

class StepInputField extends StatelessWidget {
  final RegistrationStep step;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const StepInputField({
    super.key,
    required this.step,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  @override
  Widget build(BuildContext context) {
    if (step == RegistrationStep.password) {
      return Column(
        children: [
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(Icons.lock_outline),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: confirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: Icon(Icons.lock),
            ),
          ),
        ],
      );
    }

    late final TextEditingController controller;
    String label;
    Icon? icon;

    switch (step) {
      case RegistrationStep.firstName:
        controller = firstNameController;
        label = "Enter your first name";
        icon = const Icon(Icons.person);
        break;
      case RegistrationStep.lastName:
        controller = lastNameController;
        label = "Enter your last name";
        icon = const Icon(Icons.person_outline);
        break;
      case RegistrationStep.email:
        controller = emailController;
        label = "Enter your email";
        icon = const Icon(Icons.email_outlined);
        break;
      default:
        controller = TextEditingController();
        label = "";
        icon = null;
    }

    return TextField(
      controller: controller,
      cursorColor: AppColors.appOrange,
      decoration: InputDecoration(
        prefixIcon: icon,
        labelText: label,
      ),
    );
  }
}