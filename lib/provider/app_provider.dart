import 'dart:io';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info/package_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version/version.dart';
import 'package:flutter_start_app/model/setting.dart';
import 'package:flutter_start_app/analytics.dart';

part 'gen/app_provider.g.dart';
part 'gen/app_provider.freezed.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(false) bool initialized,
    @Default(Setting())Setting setting,
    String? appVersion,
  }) = _AppState;
}

@riverpod
class App extends _$App {
  @override
  AppState build() {
    // firebaseの初期化
    Firebase.initializeApp().then((value) async {
      // アプリの設定情報取得
      final prefs = await SharedPreferences.getInstance();
      // 初期化完了
      state = state.copyWith(
        initialized: true,
        setting: Setting.fromJson(jsonDecode(prefs.getString("setting") ?? "{}")),
      );

      // firebase remote config
      final remoteConfig = FirebaseRemoteConfig.instance;

      // アプリ情報の取得
      final packageInfo = await PackageInfo.fromPlatform();
      state = state.copyWith(appVersion: packageInfo.version);

      // firebase remote config
      final result = await remoteConfig.fetchAndActivate();
      if (result) {
        // ストアに公開前のアプリは除外したいのでデフォルトで収集無効として、公開済みのバージョンだったら収集を開始する
        final field = Platform.isIOS ? "ios_release_app_version" : "android_release_app_version";
        final releaseVersionStr = remoteConfig.getString(field);

        // RemoteConfigの設定ミスなどで値が取得できない場合は収集する
        if (releaseVersionStr.isEmpty) {
          Analytics.enable();
          return;
        }

        // バージョンを比較
        if (Version.parse(releaseVersionStr) < Version.parse(packageInfo.version)) return;

        Analytics.enable();
      }
    });

    return AppState(initialized: false);
  }

  Future updateSetting(Setting setting) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("setting", jsonEncode(setting.toJson()));
    state = state.copyWith.call(setting: setting);
  }
}
