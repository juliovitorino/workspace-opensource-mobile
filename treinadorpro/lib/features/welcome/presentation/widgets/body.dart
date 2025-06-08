import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:treinadorpro/core/provider/app_config_provider.dart';
import 'package:treinadorpro/core/widgets/pro_widget_brand_image.dart';
import 'package:treinadorpro/features/login/presentation/pages/login_page.dart';
import 'package:treinadorpro/features/register/presentation/pages/register_page.dart';
import 'package:treinadorpro/features/welcome/presentation/widgets/background.dart';
import 'package:treinadorpro/core/widgets/pro_widget_rounded_button.dart';
import 'package:treinadorpro/features/welcome/presentation/widgets/pro_widget_language_dropdown_button.dart';
import 'package:treinadorpro/l10n/app_localizations.dart';

import '../../../../config/app_config.dart';

class Body extends ConsumerWidget {

  Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppConfig config = ref.watch(appConfigProvider);

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
          ProWidgetBrandImage(imagePath: "assets/logos/logo.jpg", height: 246, width: 256),
          SizedBox(height: size.height * 0.03),
          ProWidgetRoundedButton(
            text: AppLocalizations.of(context)!.login,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
              );
            },
          ),
          ProWidgetRoundedButton(
            text: AppLocalizations.of(context)!.signup,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return RegisterPage();
                  },
                ),
              );
            },
          ),
          SizedBox(height: size.height * 0.03),
          Text(AppLocalizations.of(context)!.languages),
          ProWidgetLanguageDropdownButton(),
          Text('Versão ${config.appMinorVersion} - ${config.enviroment}')
        ],
      ),
    );
  }
}
