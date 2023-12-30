import 'package:flutter/material.dart';
import 'package:leaflink/components/my_textfield.dart';
import 'package:leaflink/components/my_button.dart';
import 'package:leaflink/pages/forgotpass_page.dart';
import 'package:leaflink/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key, required this.onTap});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final void Function()? onTap;

  Future<void> signInUser(BuildContext context) async {
    try {
      // Sign in user with email and password
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Display success message or navigate to the next screen
      print('User signed in successfully!');

      // Navigate to the next screen or home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } catch (e) {
      // Handle sign-in errors
      print('Error during sign-in: $e');
      // Display an error message to the user if needed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during sign-in: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    void forgotPassword() {
      Navigator.pushNamed(context, ForgotPasswordPage.routeName);
    }

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  color: const Color.fromRGBO(0, 96, 91, 1),
                  child: Image.asset(
                    'assets/images/background.jpg',
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.zero,
                      ),
                      color: const Color.fromRGBO(246, 245, 235, 1),
                      border: const Border(
                        left: BorderSide(
                          width: 3,
                        ),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                SafeArea(
                  child: Positioned(
                    bottom: 0,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 1,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome back you\'ve been missed!',
                            style: TextStyle(
                              color: const Color.fromRGBO(11, 60, 73, 1),
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.02,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          MyTextField(
                            controller: emailController,
                            hintText: 'Email',
                            obscureText: false,
                          ),
                          MyTextField(
                            controller: passwordController,
                            hintText: 'Password',
                            obscureText: true,
                          ),
                          MyButton(
                            onTap: () => signInUser(context),
                            text: 'Sign In',
                          ),
                          GestureDetector(
                            onTap: forgotPassword,
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Color.fromRGBO(66, 123, 138, 1),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                                left: 25.0, right: 25.0, bottom: 2.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Divider(
                                    thickness: 0.5,
                                    color: Color.fromRGBO(66, 123, 138, 1),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    'Or continue with',
                                    style: TextStyle(
                                        color: Color.fromRGBO(66, 123, 138, 1)),
                                  ),
                                ),
                                Expanded(
                                  child: Divider(
                                      thickness: 0.5,
                                      color: Color.fromRGBO(66, 123, 138, 1)),
                                ),
                              ],
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Add your social login buttons here (unchanged code)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Not a member?',
                                style: TextStyle(
                                    color:
                                        const Color.fromRGBO(66, 123, 138, 1),
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02),
                              ),
                              const SizedBox(width: 4),
                              GestureDetector(
                                onTap: onTap,
                                child: Text(
                                  'Register now',
                                  style: TextStyle(
                                    color: const Color.fromRGBO(74, 42, 42, 1),
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.02,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
