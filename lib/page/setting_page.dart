import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_settings_ui/flutter_settings_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_start_app/localize.dart';
import 'package:flutter_start_app/environment.dart';
import 'package:flutter_start_app/enum/lang.dart';
import 'package:flutter_start_app/enum/theme.dart';
import 'package:flutter_start_app/provider/app_provider.dart';

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
                    SettingsTile(
                      titleWidget: Text(AppLocalizations.of(context).labelTheme),
                      subtitle: ref.watch(appProvider).setting.theme.i18n(context),
                      onPressed: (context) {
                        showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            title: Text(AppLocalizations.of(context).labelTheme),
                            children: Theme.values.map((x) {
                              return SimpleDialogOption(
                                child: Text(x.i18n(context)),
                                onPressed: () {
                                  final setting = ref.read(appProvider).setting.copyWith(theme: x);
                                  ref.read(appProvider.notifier).updateSetting(setting);
                                  Navigator.pop(context);
                                },
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),

                    // 言語
                    SettingsTile(
                      titleWidget: Text(AppLocalizations.of(context).labelLang),
                      subtitle: ref.watch(appProvider).setting.lang.i18n(context),
                      onPressed: (context) {
                        showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            title: Text(AppLocalizations.of(context).labelLang),
                            children: Lang.values.map((x) {
                              return SimpleDialogOption(
                                child: Text(x.i18n(context)),
                                onPressed: () {
                                  final setting = ref.read(appProvider).setting.copyWith(lang: x);
                                  ref.read(appProvider.notifier).updateSetting(setting);
                                  Navigator.pop(context);
                                },
                              );
                            }).toList(),
                          ),
                        );
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
