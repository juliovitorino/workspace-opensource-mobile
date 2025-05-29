import 'package:flutter/material.dart';
import 'package:treinadorpro/features/login/presentation/pages/login_page.dart';
import 'package:treinadorpro/features/welcome/presentation/widgets/background.dart';
import 'package:treinadorpro/core/widgets/rounded_button.dart';
import 'package:treinadorpro/features/welcome/presentation/widgets/language_dropdown_button.dart';
import 'package:treinadorpro/l10n/app_localizations.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.welcome + " TREINADOR PRO",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03),
          Image.asset("assets/images/exercises.png", height: size.height * 0.4),
          SizedBox(height: size.height * 0.03),
          RoundedButton(
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
          RoundedButton(text: AppLocalizations.of(context)!.signup, onPressed: () {}),
          SizedBox(height: size.height * 0.03),
          Text(AppLocalizations.of(context)!.languages),
          LanguageDropdownButton(),
        ],
      ),
    );
  }
}
