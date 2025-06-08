import 'package:flutter/material.dart';
import 'package:treinadorpro/config/app_config.dart';
import 'package:treinadorpro/config/service_locator.dart';

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
