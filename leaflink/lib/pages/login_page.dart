import 'package:flutter/material.dart';
import 'package:leaflink/components/my_textfield.dart';
import 'package:leaflink/components/square_tile.dart';
import 'package:leaflink/components/my_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key, required this.onTap});

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final void Function()? onTap;

  //signuserin method
  void signUserin() {}

  @override
  Widget build(BuildContext context) {
    void forgotpass() {
      Navigator.pushNamed(context, ForgotPasswordPage.routeName);
    }

    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(children: [
            Container(
              alignment: Alignment.center, // use aligment
              color: const Color.fromRGBO(0, 96, 91, 1),
              child: Image.asset('assets/images/background.jpg',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(50), bottomRight: Radius.zero),
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
                      offset: const Offset(0, 3), // changes position of shadow
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
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // welcome back, you've been missed!
                        Text(
                          'Welcome back you\'ve been missed!',
                          style: TextStyle(
                            color: const Color.fromRGBO(11, 60, 73, 1),
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // email textfield
                        MyTextField(
                          controller: emailController,
                          hintText: 'Email',
                          obscureText: false,
                        ),

                        // password textfield
                        MyTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                        ),

                        // sign in button
                        MyButton(
                          onTap: onTap,
                          text: 'Sign In',
                        ),

                        //forgot password
                        GestureDetector(
                          onTap: forgotpass,
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: Color.fromRGBO(66, 123, 138, 1),
                            ),
                          ),
                        ),

                        // or continue with
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
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
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

                        // google + apple sign in buttons
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // google button
                            SquareTile(imagePath: 'assets/images/google.png'),

                            SizedBox(width: 25),

                            // apple button
                            SquareTile(imagePath: 'assets/images/apple.png'),
                          ],
                        ),

                        // not a member? register now
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Not a member?',
                              style: TextStyle(
                                  color: const Color.fromRGBO(66, 123, 138, 1),
                                  fontSize: MediaQuery.of(context).size.height *
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
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ])),
            ))
          ]),
        ),
      ),
    ));
  }
}
