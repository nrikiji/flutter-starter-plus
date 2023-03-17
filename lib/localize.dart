import 'package:flutter/cupertino.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ja'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async => AppLocalizations(locale);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}

class AppLocalizations {
  final LocalizeMessages messages;

  AppLocalizations(Locale locale) : messages = LocalizeMessages.of(locale);

  static LocalizeMessages of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!.messages;
  }
}

class LocalizeMessages {
  final String greet;
  final String titleSettings;
  final String labelSettings;
  final String labelTheme;
  final String labelLang;
  final String labelThisApp;
  final String labelContact;
  final String labelPolicy;
  final String labelThemeSystem;
  final String labelThemeLight;
  final String labelThemeDark;
  final String labelLangSystem;
  final String labelLangJa;
  final String labelLangEn;

  LocalizeMessages({
    required this.greet,
    required this.titleSettings,
    required this.labelSettings,
    required this.labelTheme,
    required this.labelLang,
    required this.labelThisApp,
    required this.labelContact,
    required this.labelPolicy,
    required this.labelThemeSystem,
    required this.labelThemeLight,
    required this.labelThemeDark,
    required this.labelLangSystem,
    required this.labelLangJa,
    required this.labelLangEn,
  });

  factory LocalizeMessages.of(Locale locale) {
    switch (locale.languageCode) {
      case 'ja':
        return LocalizeMessages.ja();
      case 'en':
        return LocalizeMessages.en();
      default:
        return LocalizeMessages.en();
    }
  }

  factory LocalizeMessages.ja() => LocalizeMessages(
        greet: 'こんにちは',
        titleSettings: '設定',
        labelSettings: '設定',
        labelTheme: 'テーマ',
        labelLang: '言語',
        labelThisApp: 'このアプリについて',
        labelContact: 'お問合せ',
        labelPolicy: 'プライバシーポリシー',
        labelThemeSystem: 'システム',
        labelThemeLight: 'ライト',
        labelThemeDark: 'ダーク',
        labelLangSystem: 'システム',
        labelLangJa: '日本語',
        labelLangEn: '英語',
      );

  factory LocalizeMessages.en() => LocalizeMessages(
        greet: 'Hello',
        titleSettings: 'Settings',
        labelSettings: 'Settings',
        labelTheme: 'Theme',
        labelLang: 'Language',
        labelThisApp: 'About This App',
        labelContact: 'Contact',
        labelPolicy: 'Privacy Policy',
        labelThemeSystem: 'System',
        labelThemeLight: 'Light',
        labelThemeDark: 'Dark',
        labelLangSystem: 'System',
        labelLangJa: 'Japanese',
        labelLangEn: 'English',
      );
}
