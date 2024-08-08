import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_start_app/firebase_options.dart';
import 'package:flutter_start_app/localize.dart';
import 'package:flutter_start_app/enum/lang.dart';
import 'package:flutter_start_app/enum/theme.dart';
import 'package:flutter_start_app/page/home/page.dart';
import 'package:flutter_start_app/provider/app_provider.dart';

void main() async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    return runApp(const ProviderScope(child: MyApp()));
  }, (error, stackTrace) {
    FirebaseCrashlytics.instance.recordError(error, stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      // 言語設定またはテーマが変更されたら再ビルド
      final locale = ref.watch(appProvider.select((state) => state.setting.lang.locale));
      final themeMode = ref.watch(appProvider.select((state) => state.setting.theme.themeMode));

      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(),
        locale: locale,
        themeMode: themeMode,
        darkTheme: ThemeData.dark().copyWith(),
        localizationsDelegates: const [
          AppLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ja'),
        ],
        home: ref.watch(appProvider.select((state) => state.initialized))
            ? const MyHomePage(title: "hello")
            : const SimpleTextPage(message: "Loading"),
      );
    });
  }
}

class SimpleTextPage extends StatelessWidget {
  final String message;
  const SimpleTextPage({super.key, required this.message});

  @override
  Widget build(BuildContext context) => //
      Scaffold(body: Center(child: Text(message)));
}
