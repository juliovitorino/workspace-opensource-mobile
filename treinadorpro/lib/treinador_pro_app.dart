import 'package:flutter/material.dart';
import 'package:treinadorpro/config/service_locator.dart';
import 'package:treinadorpro/core/constants/styles.dart';
import 'package:treinadorpro/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:treinadorpro/features/login/presentation/pages/login_page.dart';
import 'package:treinadorpro/features/splash/presentation/pages/splash_page.dart';
import 'package:treinadorpro/l10n/app_localizations.dart';

import 'config/app_config.dart';
import 'core/constants/app_routes.dart';
import 'features/validatesixdigit/presentation/validate_six_digit_page.dart';
import 'features/welcome/presentation/pages/welcome_screen.dart';

class TreinadorProApp extends StatefulWidget {
  final AppConfig config;

  static void setLocale(BuildContext context, Locale newLocale) {
    final _TreinadorProAppState? state = context.findAncestorStateOfType<_TreinadorProAppState>();
    state?.setLocale(newLocale);
  }

  TreinadorProApp({super.key, required this.config});

  @override
  State<TreinadorProApp> createState() => _TreinadorProAppState();
}

class _TreinadorProAppState extends State<TreinadorProApp> {
  Locale _locale = const Locale('pt');

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Treinador Pro',
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white
      ),
      home: SplashPage(config: widget.config),
      routes: {
        AppRoutes.validateCode: (context) => ValidateSixDigitPage(config: widget.config,),
        AppRoutes.login: (context) => LoginPage(config: widget.config,),
        AppRoutes.welcome: (context) => WelcomeScreen(config: widget.config,),
        AppRoutes.dashboard: (context) => DashboardPage()
      },
    );  }
}

