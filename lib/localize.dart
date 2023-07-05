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
  // Settings
  final String titleSettings;
  final String labelSettings;
  final String labelTheme;
  final String labelLang;

  // App Information
  final String labelThisApp;
  final String labelContact;
  final String labelPolicy;

  // Theme
  final String labelThemeSystem;
  final String labelThemeLight;
  final String labelThemeDark;

  // Language
  final String labelLangSystem;
  final String labelLangJa;
  final String labelLangEn;

  // Review Dialog
  final String labelReviewOk;
  final String labelReviewCancel;
  final String labelReviewDeny;
  final String labelMessage;
  final String labelConfirm;
  final String labelOk;
  final String labelCancel;
  final String labelReviewApp;
  final String labelLaunchAppStore;
  final String labelLaunchPlayStore;
  final String messageReview;

  // RUL
  final String contactUrl;
  final String policyUrl;

  LocalizeMessages({
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
    required this.labelReviewOk,
    required this.labelReviewCancel,
    required this.labelReviewDeny,
    required this.labelMessage,
    required this.labelConfirm,
    required this.labelOk,
    required this.labelCancel,
    required this.labelReviewApp,
    required this.labelLaunchAppStore,
    required this.labelLaunchPlayStore,
    required this.messageReview,
    required this.contactUrl,
    required this.policyUrl,
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
        // 設定関連
        titleSettings: '設定',
        labelSettings: '設定',
        labelTheme: 'テーマ',
        labelLang: '言語',
        labelThemeSystem: 'システム',
        labelThemeLight: 'ライト',
        labelThemeDark: 'ダーク',
        labelLangSystem: 'システム',
        labelLangJa: '日本語',
        labelLangEn: '英語',

        // その他アプリ情報関連
        labelThisApp: 'このアプリについて',
        labelContact: 'お問合せ',
        labelPolicy: 'プライバシーポリシー',

        // メッセージ関連
        labelMessage: 'メッセージ',
        labelConfirm: '確認',
        labelOk: 'OK',
        labelCancel: 'キャンセル',

        // アプリレビュー関連
        labelReviewOk: '評価する',
        labelReviewCancel: 'また今度',
        labelReviewDeny: 'このメッセージを2度と表示しない',
        labelReviewApp: 'このアプリを評価する',
        labelLaunchAppStore: 'App Storeで開く',
        labelLaunchPlayStore: 'Play Storeで開く',
        messageReview: 'ご利用いただきありがとうございます。\n\nアプリ改善の励みになりますので、よろしければ評価をお願いします。',

        // URL
        contactUrl: "https://",
        policyUrl: "https://",
      );

  factory LocalizeMessages.en() => LocalizeMessages(
        // 設定関連
        titleSettings: 'Settings',
        labelSettings: 'Settings',
        labelTheme: 'Theme',
        labelLang: 'Language',
        labelThemeSystem: 'System',
        labelThemeLight: 'Light',
        labelThemeDark: 'Dark',
        labelLangSystem: 'System',
        labelLangJa: 'Japanese',
        labelLangEn: 'English',

        // その他アプリ情報関連
        labelThisApp: 'About This App',
        labelContact: 'Contact',
        labelPolicy: 'Privacy Policy',

        // メッセージ関連
        labelMessage: 'Message',
        labelConfirm: 'Confirmation',
        labelOk: 'OK',
        labelCancel: 'Cancel',

        // アプリレビュー関連
        labelReviewOk: 'Rate Now',
        labelReviewCancel: 'Later',
        labelReviewDeny: 'Don\'t show again',
        labelReviewApp: 'Rate This App',
        labelLaunchAppStore: 'Open in App Store',
        labelLaunchPlayStore: 'Open in Play Store',
        messageReview: 'Thank you for using our app.\n\nYour rating would be a great motivation for us to improve our app.',

        // URL
        contactUrl: "https://",
        policyUrl: "https://",
      );
}
