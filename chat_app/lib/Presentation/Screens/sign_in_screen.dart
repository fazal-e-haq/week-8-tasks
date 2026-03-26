import 'package:chat_app/Presentation/Screens/home_screen.dart';
import 'package:chat_app/Presentation/Screens/sign_up_screen.dart';
import 'package:chat_app/Presentation/Widgets/button_widget.dart';
import 'package:chat_app/Presentation/Widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Services/auth_service.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final authService = AuthService();
  GlobalKey<State> formKey = GlobalKey();
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
                  'Welcome Back',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: size.height * 0.1),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
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
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                //Button
                ButtonWidget(
                  onTap: () {
                    authService.signIn(
                      emailController.text.toString(),
                      passwordController.text.toString(),
                    );
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                  },
                  text: 'Sign In',
                ),
                SizedBox(height: size.height * 0.015),
                // account
                Row(
                  mainAxisAlignment: .center,
                  children: [
                    Text(
                      'Dont have an account? ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up ',
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
