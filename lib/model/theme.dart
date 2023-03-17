import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_start_app/localize.dart';

enum Theme {
  system("system"),
  light("light"),
  dark("dart");

  const Theme(this.value);
  final String value;
}

extension ThemeExtension on Theme {
  static final themeModes = {
    Theme.system: ThemeMode.system,
    Theme.light: ThemeMode.light,
    Theme.dark: ThemeMode.dark,
  };

  ThemeMode? get themeMode => themeModes[this];

  String i18n(BuildContext context) {
    switch (this) {
      case Theme.system:
        return AppLocalizations.of(context).labelThemeSystem;
      case Theme.light:
        return AppLocalizations.of(context).labelThemeLight;
      case Theme.dark:
        return AppLocalizations.of(context).labelThemeDark;
    }
  }
}
