import 'package:flutter/material.dart';

class ProWidgetTextSplash extends StatelessWidget {
  final String text;

  const ProWidgetTextSplash({super.key, required this.text});

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
