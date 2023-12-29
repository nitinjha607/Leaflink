import 'package:flutter/material.dart';
import 'package:leaflink/components/my_textfield.dart';
import 'package:leaflink/components/my_button.dart';

class ForgotPasswordPage extends StatelessWidget {
  static const String routeName = 'forgot_password_page';
  ForgotPasswordPage({super.key});

  // text editing controllers
  final emailorusernameController = TextEditingController();

  //signuserin method
  void back(BuildContext context) {
    Navigator.of(context).pop();
  }

  void confirm() {}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SafeArea(
      child: Center(
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center, // use aligment
              color: const Color.fromRGBO(0, 96, 91, 1),
              child: Image.asset('assets/images/background.jpg',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                color: const Color.fromRGBO(246, 245, 235, 1),
                onPressed: () => back(context),
              ),
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
                              // back button

                              Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  color: const Color.fromRGBO(11, 60, 73, 1),
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),

                              Text(
                                'Enter the email or username associated with your account, we will send you a link to change the password',
                                style: TextStyle(
                                  color: const Color.fromRGBO(66, 123, 138, 1),
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                textAlign:
                                    TextAlign.center, // Center align the text
                              ),

                              // email textfield
                              MyTextField(
                                controller: emailorusernameController,
                                hintText: 'Email/Username',
                                obscureText: false,
                              ),

                              MyButton(
                                onTap: confirm,
                                text: 'Confirm',
                              ),
                            ])))),
          ],
        ),
      ),
    )));
  }
}
