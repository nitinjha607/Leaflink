import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:leaflink/auth/login_or_register.dart';
import 'package:leaflink/pages/forgotpass_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBzLPGrr3V11mHhIVFk_friu47oR5LBsSs',
      authDomain: 'leaf-link-1e912-default-rtdb.firebaseio.com',
      projectId: 'leaf-link-1e912',
      appId: '821697692793:android:195ad8509aa13d7ac400a8',
      messagingSenderId: '821697692793',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LogInOrRegister(),
      routes: <String, WidgetBuilder>{
        ForgotPasswordPage.routeName: (BuildContext context) =>
            ForgotPasswordPage(),
      },
    );
  }
}
