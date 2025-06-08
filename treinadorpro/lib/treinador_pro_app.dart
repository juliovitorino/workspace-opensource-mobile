import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/constants/styles.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:treinadorpro/features/login/presentation/pages/login_page.dart';
import 'package:treinadorpro/features/splash/presentation/pages/splash_page.dart';
import 'package:treinadorpro/l10n/app_localizations.dart';

import 'config/app_config.dart';
import 'core/constants/app_routes.dart';
import 'features/validatesixdigit/presentation/validate_six_digit_page.dart';
import 'features/welcome/presentation/pages/welcome_screen.dart';

class TreinadorProApp extends ConsumerStatefulWidget {

  static void setLocale(BuildContext context, Locale newLocale) {
    final _TreinadorProAppState? state = context.findAncestorStateOfType<_TreinadorProAppState>();
    state?.setLocale(newLocale);
  }

  const TreinadorProApp({super.key});

  @override
  ConsumerState<TreinadorProApp> createState() => _TreinadorProAppState();
}

class _TreinadorProAppState extends ConsumerState<TreinadorProApp> {
  Locale _locale = const Locale('pt');
  late final AppConfig config;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void initState() {
    super.initState();

    // get appConfig instance at the beggining life cycle
    config = ref.read(appConfigProvider);
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
      home: SplashPage(),
      routes: {
        AppRoutes.validateCode: (context) => ValidateSixDigitPage(),
        AppRoutes.login: (context) => LoginPage(),
        AppRoutes.welcome: (context) => WelcomeScreen(),
        AppRoutes.dashboard: (context) => DashboardPage()
      },
    );  }
}

