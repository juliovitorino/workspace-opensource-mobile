import 'package:flutter/material.dart';
import 'package:treinadorpro/config/service_locator.dart';
import 'package:treinadorpro/core/widgets/brand_image.dart';
import 'package:treinadorpro/features/login/presentation/pages/login_page.dart';
import 'package:treinadorpro/features/register/presentation/pages/register_page.dart';
import 'package:treinadorpro/features/welcome/presentation/widgets/background.dart';
import 'package:treinadorpro/core/widgets/rounded_button.dart';
import 'package:treinadorpro/features/welcome/presentation/widgets/language_dropdown_button.dart';
import 'package:treinadorpro/l10n/app_localizations.dart';

import '../../../../config/app_config.dart';

class Body extends StatelessWidget {
  final AppConfig config;

  Body({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.welcome + config.appName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03),
          BrandImage(imagePath: "assets/logos/logo.jpg", height: 246, width: 256),
          SizedBox(height: size.height * 0.03),
          RoundedButton(
            text: AppLocalizations.of(context)!.login,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage(config: config);
                  },
                ),
              );
            },
          ),
          RoundedButton(
            text: AppLocalizations.of(context)!.signup,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RegisterPage(config: config);
                  },
                ),
              );
            },
          ),
          SizedBox(height: size.height * 0.03),
          Text(AppLocalizations.of(context)!.languages),
          LanguageDropdownButton(),
          Text('Versão ${config.appMinorVersion} - ${config.enviroment}')
        ],
      ),
    );
  }
}
