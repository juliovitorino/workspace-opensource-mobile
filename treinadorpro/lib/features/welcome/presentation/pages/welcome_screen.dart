import 'package:flutter/material.dart';
import 'package:treinadorpro/config/app_config.dart';

import '../widgets/body.dart';

class WelcomeScreen extends StatelessWidget {
  final AppConfig config;
  const WelcomeScreen({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(config: config),
    );
  }
}
