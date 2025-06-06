import 'package:flutter/material.dart';
import 'package:treinadorpro/core/constants/styles.dart';

class ProWidgetTextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  const ProWidgetTextFieldContainer({super.key, required this.child, this.color = kPrimaryLightColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(29)
      ),
      child: child,
    );
  }
}
