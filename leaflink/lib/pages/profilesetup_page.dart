import 'package:flutter/material.dart';
import 'package:leaflink/components/my_textfield.dart';
import 'package:leaflink/components/my_button.dart';

class ProfileSetupPage extends StatelessWidget {
  ProfileSetupPage({super.key});

  // text editing controllers
  final nameController = TextEditingController();
  final pronounsController = TextEditingController();
  final aboutController = TextEditingController();
  //finishSetup method
  void finishSetup() {}

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
                        height: MediaQuery.of(context).size.height * 1,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Setup your Profile',
                                style: TextStyle(
                                  color: const Color.fromRGBO(11, 60, 73, 1),
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),

                              // email textfield
                              MyTextField(
                                controller: nameController,
                                hintText: 'Name',
                                obscureText: false,
                              ),

                              //username textfield
                              MyTextField(
                                controller: pronounsController,
                                hintText: 'Pronouns',
                                obscureText: false,
                              ),

                              // password textfield
                              MyTextField(
                                controller: aboutController,
                                hintText: 'About me',
                                obscureText: false,
                              ),

                              // finish setup button
                              MyButton(
                                onTap: finishSetup,
                                text: 'Finish',
                              ),
                            ]))))
          ]),
        ),
      ),
    ));
  }
}
