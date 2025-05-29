import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      alignment: Alignment.center,
      child: Stack(
        children: [
          Positioned(
            top: -20,
            left: -40,
            width: size.width * 0.5,
            child: Image.asset("assets/icons/form01.png", ),
          ),
          Positioned(
            bottom: -50,
            right: -45,
            width: size.width * 0.6,
            child: Image.asset("assets/icons/form01.png", ),
          ),
          child,
        ],
      ),
    );
  }
}
