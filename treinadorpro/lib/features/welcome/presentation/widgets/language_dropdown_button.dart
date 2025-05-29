import 'package:flutter/material.dart';

import 'package:treinadorpro/l10n/app_localizations.dart';
import '../../../../main.dart';

class LanguageDropdownButton extends StatelessWidget {
  const LanguageDropdownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Locale>(
      value: Localizations.localeOf(context),
      onChanged: (Locale? newLocale) {
        if (newLocale != null) {
          MyApp.setLocale(context, newLocale);
        }
      },
      items: [
        DropdownMenuItem(value: const Locale('pt'), child: Text(AppLocalizations.of(context)!.ptLanguage)),
        DropdownMenuItem(value: const Locale('en'), child: Text(AppLocalizations.of(context)!.enLanguage)),
        DropdownMenuItem(value: const Locale('es'), child: Text(AppLocalizations.of(context)!.esLanguage)),
      ],
    );
  }
}
