import 'package:flutter/material.dart';
import 'package:treinadorpro/core/constants/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color color, textColor;

  const RoundedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.8,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Text(text, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}
