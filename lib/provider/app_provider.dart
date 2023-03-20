import 'dart:io';
import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_start_app/enum/review_status.dart';
import 'package:flutter_start_app/model/user_action.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info/package_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:version/version.dart';
import 'package:flutter_start_app/model/setting.dart';
import 'package:flutter_start_app/analytics.dart';

part '../gen/provider/app_provider.g.dart';
part '../gen/provider/app_provider.freezed.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(false) bool initialized,
    @Default(Setting()) Setting setting,
    @Default(UserAction()) UserAction userAction,
    String? appVersion,
  }) = _AppState;
}

@riverpod
class App extends _$App {
  // SharedPreferences
  late SharedPreferences sharedPreferences;

  // アプリのセッション内にレビューダイアログを表示したかどうかを管理する
  bool hasShownReviewDialog = false;

  @override
  AppState build() {
    // アプリ初期化
    Future.wait([
      Firebase.initializeApp(), // firebase
      PackageInfo.fromPlatform(), // パッケージ情報
      SharedPreferences.getInstance(), // SharedPreferences
    ]).then((value) async {
      sharedPreferences = value[2] as SharedPreferences;
      final setting = Setting.fromJson(jsonDecode(sharedPreferences.getString("setting") ?? "{}"));
      final userAction = UserAction.fromJson(jsonDecode(sharedPreferences.getString("user_action") ?? "{}"));
      final packageInfo = value[1] as PackageInfo;

      // 初期化完了
      state = state.copyWith(
        initialized: true,
        setting: setting,
        userAction: userAction.copyWith(launchCount: userAction.launchCount + 1), // アプリ起動回数をカウントアップ
        appVersion: packageInfo.version,
      );

      // Remote Config
      final remoteConfig = FirebaseRemoteConfig.instance;
      remoteConfig.fetchAndActivate().then((value) {
        // ストアに公開前のアプリは除外したいのでデフォルトで収集無効として、公開済みのバージョンだったら収集を開始する
        final field = Platform.isIOS ? "ios_release_app_version" : "android_release_app_version";
        final releaseVersionStr = remoteConfig.getString(field);

        if (releaseVersionStr.isEmpty) {
          // RemoteConfigの設定ミスなどで値が取得できなければアナリティクス有効化
          Analytics.enable();
        } else if (Version.parse(packageInfo.version) <= Version.parse(releaseVersionStr)) {
          // リリース済みのバージョンならアナリティクス有効化
          Analytics.enable();
        }
      });
    });

    return AppState(initialized: false);
  }

  Future updateSetting(Setting setting) async {
    sharedPreferences.setString("setting", jsonEncode(setting.toJson()));
    state = state.copyWith.call(setting: setting);
  }

  Future updateUserAction(UserAction userAction) async {
    sharedPreferences.setString("user_action", jsonEncode(userAction.toJson()));
    state = state.copyWith.call(userAction: userAction);
  }

  bool shouldShowReviewDialog() {
    // セッション内に表示済みなのでレビューダイアログを表示しない
    if (hasShownReviewDialog) return false;

    // アプリをインストール後、3回目の起動からレビューダイアログを表示する
    if (ref.read(appProvider).userAction.launchCount < 3) return false;

    // OKまたは拒否が押されたことがあるのでレビューダイアログを表示しない
    if (ref.read(appProvider).userAction.reviewStatus != ReviewStatus.cancel) return false;

    // その他、必要によってアプリごとにレビューダイアログを表示する条件を実装する

    // レビューダイアログを表示する
    return true;
  }
}
