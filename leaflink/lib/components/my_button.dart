import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;

  const MyButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Use the onTap callback passed to the widget
      child: Container(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.0135),
        margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.height * 0.05,
          right: MediaQuery.of(context).size.height * 0.05,
          bottom: MediaQuery.of(context).size.height * 0.009,
          top: MediaQuery.of(context).size.height * 0.009,
        ),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(11, 60, 73, 1),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color.fromRGBO(246, 245, 235, 1),
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
