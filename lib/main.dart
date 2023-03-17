import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_start_app/localize.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_start_app/enum/lang.dart';
import 'package:flutter_start_app/enum/theme.dart';
import 'package:flutter_start_app/page/home_page.dart';
import 'package:flutter_start_app/provider/app_provider.dart';

void main() {
  runZonedGuarded(
    () {
      WidgetsFlutterBinding.ensureInitialized();
      return runApp(const ProviderScope(child: MyApp()));
    },
    (e, st) {
      FirebaseCrashlytics.instance.recordError(e, st);
      log(e.toString());
      log(st.toString());
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(),
        darkTheme: ThemeData.dark().copyWith(),
        themeMode: ref.watch(appProvider.select((state) => state.setting.theme.themeMode)),
        locale: ref.watch(appProvider.select((state) => state.setting.lang.locale)),
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
