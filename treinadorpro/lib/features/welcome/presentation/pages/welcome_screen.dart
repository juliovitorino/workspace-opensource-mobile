import 'package:flutter/material.dart';

import '../widgets/body.dart';

class WelcomeScreen extends StatelessWidget {

  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
