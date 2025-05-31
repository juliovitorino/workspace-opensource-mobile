import 'package:flutter/material.dart';

class TextSplash extends StatelessWidget {
  final String text;

  const TextSplash({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
