import 'package:flutter/material.dart';
import 'package:treinadorpro/core/constants/app_routes.dart';
import 'package:treinadorpro/core/widgets/brand_image.dart';

import '../../../../config/app_config.dart';
import '../../../../config/service_locator.dart';
import '../widgets/text_splash.dart';

class SplashPage extends StatefulWidget {
  final config = getIt<AppConfig>();

  SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 5)); // simula carregamento
    if (mounted) {
      Navigator.popAndPushNamed(context, AppRoutes.welcome);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/splash/splash-08.jpg',
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 0,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(),
                  Container(
                    width: size.width,
                    color: Colors.black38,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextSplash(text: widget.config.appName),
                        TextSplash(text: 'Carregando configurações'),
                        TextSplash(
                          text: 'Versão ${widget.config.appMinorVersion}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: 5.0),
                width: size.width,
                // color: Colors.black38,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BrandImage(imagePath: 'assets/logos/logo.jpg')
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
