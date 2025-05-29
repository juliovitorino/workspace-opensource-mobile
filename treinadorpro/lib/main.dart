import 'package:flutter/material.dart';
import 'package:treinadorpro/core/constants/constants.dart';
import 'package:treinadorpro/l10n/app_localizations.dart';

import 'features/welcome/presentation/pages/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    final _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      home: WelcomeScreen(),
    );  }
}

