import 'dart:io';

import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_start_app/localize.dart';
import 'package:flutter_start_app/environment.dart';
import 'package:flutter_start_app/enum/lang.dart';
import 'package:flutter_start_app/enum/theme.dart';
import 'package:flutter_start_app/provider/app_provider.dart';

part './setting_item.dart';

class SettingPage extends ConsumerWidget {
  const SettingPage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).titleSettings),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Consumer(
        builder: (context, watch, _) {
          return Container(
            padding: const EdgeInsets.only(top: 10),
            child: SettingsList(
              sections: [
                // 設定
                SettingsSection(
                  title: AppLocalizations.of(context).labelSettings,
                  tiles: [
                    // テーマ
                    SettingItem(
                      title: AppLocalizations.of(context).labelTheme,
                      values: Theme.values,
                      getDisplayName: (theme) => theme.i18n(AppLocalizations.of(context)),
                      currentValue: ref.watch(appProvider).setting.theme,
                      onSelected: (theme) {
                        final setting = ref.read(appProvider).setting.copyWith(theme: theme);
                        ref.read(appProvider.notifier).updateSetting(setting);
                      },
                    ),

                    // 言語
                    SettingItem(
                      title: AppLocalizations.of(context).labelLang,
                      values: Lang.values,
                      getDisplayName: (lang) => lang.i18n(AppLocalizations.of(context)),
                      currentValue: ref.watch(appProvider).setting.lang,
                      onSelected: (lang) {
                        final setting = ref.read(appProvider).setting.copyWith(lang: lang);
                        ref.read(appProvider.notifier).updateSetting(setting);
                      },
                    ),
                  ],
                ),

                // このアプリについて
                SettingsSection(
                  title: "${AppLocalizations.of(context).labelThisApp}  ${ref.watch(appProvider).appVersion!}",
                  tiles: [
                    // お問い合わせ
                    SettingsTile(
                      title: AppLocalizations.of(context).labelContact,
                      onPressed: (context) => launchUrl(Uri.parse(Environment().contactUrl)),
                    ),

                    // プライバシーポリシー
                    SettingsTile(
                      title: AppLocalizations.of(context).labelPolicy,
                      onPressed: (context) => launchUrl(Uri.parse(Environment().policyUrl)),
                    ),

                    // このアプリを評価する
                    SettingsTile(
                      title: AppLocalizations.of(context).labelReviewApp,
                      onPressed: (context) {
                        final url = Platform.isAndroid ? Environment().playStoreReviewUrl : Environment().appStoreReviewUrl;
                        launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
