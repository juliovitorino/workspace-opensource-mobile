import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        children: [
          // Positioned( aqui vai entrar a forma que vai colada no canto superior esquerdo
          //   top: 0,
          //   left: 0,
          //   child: Image.asset("assets/images/exercises.png", ),
          // ),
          // Positioned( aqui vai entrar a forma que vai colada no canto inferior esquerdo
          //   bottom: 0,
          //   left: 0,
          //   child: Image.asset("assets/images/exercises.png", ),
          // ),
          child,
        ],
      ),
    );
  }
}
