import 'package:chat_app/Presentation/Screens/sign_in_screen.dart';
import 'package:chat_app/Presentation/Widgets/button_widget.dart';
import 'package:chat_app/Presentation/Widgets/text_field_widget.dart';
import 'package:chat_app/Services/auth_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final authService = AuthService();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: .symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: .center,
              children: [
                //Logo
                Icon(CupertinoIcons.circle_grid_hex_fill, size: 70),
                SizedBox(height: size.height * 0.03),

                //Wellcome
                Text(
                  'Welcome',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: size.height * 0.1),
                //Email textField
                TextFieldWidget(
                  controller: emailController,
                  hintText: 'Email',
                  prefixIcon: Icon(Icons.mail),
                ),
                SizedBox(height: size.height * 0.02),
                //Password textField
                TextFieldWidget(
                  controller: passwordController,
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.password),
                ),
                SizedBox(height: size.height * 0.05),
                //Button
                ButtonWidget(
                  onTap: () {
                    authService.signUp(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                    );
                  },
                  text: 'Sign In',
                ),
                SizedBox(height: size.height * 0.015),
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign In ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
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
