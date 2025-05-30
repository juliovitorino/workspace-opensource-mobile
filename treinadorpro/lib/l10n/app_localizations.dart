import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to '**
  String get welcome;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'LOGIN'**
  String get login;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @ptLanguage.
  ///
  /// In en, this message translates to:
  /// **'Portuguese'**
  String get ptLanguage;

  /// No description provided for @enLanguage.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get enLanguage;

  /// No description provided for @esLanguage.
  ///
  /// In en, this message translates to:
  /// **'Spanish'**
  String get esLanguage;

  /// No description provided for @signup.
  ///
  /// In en, this message translates to:
  /// **'SIGN UP'**
  String get signup;

  /// No description provided for @sucessTitle.
  ///
  /// In en, this message translates to:
  /// **'Sucesso'**
  String get sucessTitle;

  /// No description provided for @formRegisterTitle.
  ///
  /// In en, this message translates to:
  /// **'Register New User'**
  String get formRegisterTitle;

  /// No description provided for @formRegisterName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get formRegisterName;

  /// No description provided for @formRegisterNameBlank.
  ///
  /// In en, this message translates to:
  /// **'Name is required'**
  String get formRegisterNameBlank;

  /// No description provided for @formRegisterEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get formRegisterEmail;

  /// No description provided for @formRegisterEmailBlank.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get formRegisterEmailBlank;

  /// No description provided for @formRegisterPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get formRegisterPassword;

  /// No description provided for @formRegisterPasswordBlank.
  ///
  /// In en, this message translates to:
  /// **'The password should be 6 character at least'**
  String get formRegisterPasswordBlank;

  /// No description provided for @formRegisterPasswordChecker.
  ///
  /// In en, this message translates to:
  /// **'Password Re-type'**
  String get formRegisterPasswordChecker;

  /// No description provided for @formRegisterPasswordCheckerBlank.
  ///
  /// In en, this message translates to:
  /// **'The password should be 6 character at least'**
  String get formRegisterPasswordCheckerBlank;

  /// No description provided for @formRegisterBirthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday (YYYY-MM-DD)'**
  String get formRegisterBirthday;

  /// No description provided for @formRegisterBirthdayBlank.
  ///
  /// In en, this message translates to:
  /// **'Invalid date'**
  String get formRegisterBirthdayBlank;

  /// No description provided for @formRegisterButton.
  ///
  /// In en, this message translates to:
  /// **'REGISTER'**
  String get formRegisterButton;

  /// No description provided for @formRegisterSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Register successfully'**
  String get formRegisterSuccessMessage;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
