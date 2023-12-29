import 'package:flutter/material.dart';
import 'package:leaflink/auth/login_or_register.dart';
import 'package:leaflink/pages/forgotpass_page.dart';

void main() {
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
