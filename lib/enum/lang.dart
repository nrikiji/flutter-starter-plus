import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_start_app/localize.dart';

enum Lang {
  system("system"),
  ja("ja"),
  en("en");

  const Lang(this.value);
  final String value;
}

extension LangExtension on Lang {
  static final locales = {
    Lang.system: null,
    Lang.ja: const Locale("ja"),
    Lang.en: const Locale("en"),
  };

  Locale? get locale => locales[this];

  String i18n(BuildContext context) {
    switch (this) {
      case Lang.system:
        return AppLocalizations.of(context).labelLangSystem;
      case Lang.ja:
        return AppLocalizations.of(context).labelLangJa;
      case Lang.en:
        return AppLocalizations.of(context).labelLangEn;
    }
  }
}
