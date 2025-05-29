import 'package:flutter/material.dart';
import 'package:treinadorpro/core/constants/constants.dart';
import 'package:treinadorpro/l10n/app_localizations.dart';

import 'config/app_config.dart';
import 'features/welcome/presentation/pages/welcome_screen.dart';

class TreinadorProApp extends StatefulWidget {
  final AppConfig config;

  static void setLocale(BuildContext context, Locale newLocale) {
    final _TreinadorProAppState? state = context.findAncestorStateOfType<_TreinadorProAppState>();
    state?.setLocale(newLocale);
  }

  const TreinadorProApp({super.key, required this.config});

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
      home: WelcomeScreen(config: widget.config,),
    );  }
}

