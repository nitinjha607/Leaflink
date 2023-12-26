import 'package:flutter/material.dart';
import 'package:leaflink/components/my_textfield.dart';
import 'package:leaflink/components/my_button.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});

  // text editing controllers
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasController = TextEditingController();
  final void Function()? onTap;

  //signuserin method
  void registerUser() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(children: [
            Container(
              alignment: Alignment.center, // use aligment
              color: const Color.fromRGBO(0, 96, 91, 1),
              child: Image.asset('assets/images/background.jpg',
                  height: 1500, width: 500, fit: BoxFit.cover),
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
                        height: MediaQuery.of(context).size.height * 1,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Welcome to Leaflink!',
                                style: TextStyle(
                                  color: const Color.fromRGBO(11, 60, 73, 1),
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // email textfield
                              MyTextField(
                                controller: emailController,
                                hintText: 'Email',
                                obscureText: false,
                              ),

                              //username textfield
                              MyTextField(
                                controller: usernameController,
                                hintText: 'Username',
                                obscureText: false,
                              ),

                              // password textfield
                              MyTextField(
                                controller: passwordController,
                                hintText: 'Password',
                                obscureText: true,
                              ),

                              //confirmPas textfield
                              MyTextField(
                                controller: confirmPasController,
                                hintText: 'Re-enter Password',
                                obscureText: true,
                              ),

                              // sign in button
                              MyButton(
                                onTap: registerUser,
                                text: 'Register',
                              ),

                              // Already have an account?login here
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an account?',
                                    style: TextStyle(
                                        color: const Color.fromRGBO(
                                            66, 123, 138, 1),
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                  ),
                                  const SizedBox(width: 4),
                                  GestureDetector(
                                    onTap: onTap,
                                    child: Text(
                                      'Login here',
                                      style: TextStyle(
                                          color: const Color.fromRGBO(
                                              74, 42, 42, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02),
                                    ),
                                  ),
                                ],
                              )
                            ]))))
          ]),
        ),
      ),
    ));
  }
}
