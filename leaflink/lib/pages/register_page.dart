import 'package:flutter/material.dart';
import 'package:leaflink/components/my_textfield.dart';
import 'package:leaflink/components/my_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leaflink/pages/home.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key, required this.onTap});

  // text editing controllers
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasController = TextEditingController();
  final void Function()? onTap;

  // Firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Firebase Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register user method
  Future<void> registerUser(BuildContext context) async {
    try {
      // Create a user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Store additional user information in Firebase Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'username': usernameController.text,
        'email': emailController.text,
        // Add other user details as needed
      });

      // Display success message or navigate to the next screen
      print('User registered successfully!');

      // Navigate to the home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    } catch (e) {
      // Handle registration errors
      print('Error during registration: $e');
      // Display an error message to the user if needed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during registration: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          'Welcome to Leaflink!',
                          style: TextStyle(
                            color: const Color.fromRGBO(11, 60, 73, 1),
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        MyTextField(
                          controller: emailController,
                          hintText: 'Email',
                          obscureText: false,
                        ),
                        MyTextField(
                          controller: usernameController,
                          hintText: 'Username',
                          obscureText: false,
                        ),
                        MyTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                        ),
                        MyTextField(
                          controller: confirmPasController,
                          hintText: 'Re-enter Password',
                          obscureText: true,
                        ),
                        MyButton(
                          onTap: () => registerUser(context),
                          text: 'Register',
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                color: const Color.fromRGBO(66, 123, 138, 1),
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                            ),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: onTap,
                              child: Text(
                                'Login here',
                                style: TextStyle(
                                  color: const Color.fromRGBO(74, 42, 42, 1),
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
