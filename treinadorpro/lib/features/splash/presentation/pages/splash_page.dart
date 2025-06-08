import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/constants/app_routes.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/widgets/pro_widget_brand_image.dart';

import '../../../../config/app_config.dart';
import '../widgets/pro_widget_text_splash.dart';

class SplashPage extends ConsumerStatefulWidget {

  SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {

  late final AppConfig config;

  @override
  void initState() {
    super.initState();
    config = ref.read(appConfigProvider);
    _simulateLoading();
  }

  Future<void> _simulateLoading() async {
    await Future.delayed(const Duration(seconds: 5)); // simula carregamento ... substituir por carga de parametrizações globais
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
                        ProWidgetTextSplash(text: config.appName),
                        ProWidgetTextSplash(text: 'Carregando configurações'),
                        ProWidgetTextSplash(
                          text: 'Versão ${config.appMinorVersion}',
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
                    ProWidgetBrandImage(imagePath: 'assets/logos/logo.jpg')
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
