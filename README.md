# flutter-starter-plus

これは、よく使用するflutterの設定と機能を事前に用意し、プロジェクトを迅速に開始できるようにしたテンプレートプロジェクトです。また、一般的な画面や機能をすぐに利用できるようにもなっています。

flutterのバージョンは3.19.5

以下は、主な設定と機能の説明です。  

主な設定:  
- ビルド設定(DebugかRelease)ごとに、アプリ名やアプリID(Bundle Identifier、Application ID)を変更できます。
- ビルド時に環境(DevかProd)ごとに定義した値で切り替えることができます。例えば、Web APIの接続先を変更できます。
- Firebase SDKを組み込んでいます。また、ビルド設定(DebugかRelease)ごとに、Firebaseの設定ファイルを切り替えることができます。
- GitHub Actionsを使用して、App StoreまたはPlay Storeにアプリをアップロードできます。また、アップロードのタイミングはgit tagとしています。
- 多言語に対応しています。

※ Firebaseプロジェクト・アプリが作成されていることを前提とする <a href="#firebaseプロジェクト・アプリの作成">※参考</a>  

主な機能:
- ユーザーがテーマや言語設定を変更できるようにしています。設定内容はSharedPreferencesに保存され、[flutter_settings_ui](https://pub.dev/documentation/flutter_settings_ui/latest/)を使用してUIを構築しています。
- Firebase SDKの初期化を行い、Analytics、Crashlytics、RemoteConfigの機能を使用できます。また、RemoteConfigで設定したアプリのバージョン以下の場合のみ計測を有効にすることができます。
- レビューを促すダイアログの表示制御を行えます。
- 状態管理には[Riverpod](https://github.com/rrousselGit/riverpod)を使用しています。

セットアップ手順
1. [プロジェクトのクローン](#プロジェクトのクローン)
1. [git管理対象外のファイルを手動で追加する](#git管理対象外のファイルを手動で追加する)
1. [AndroidStudioビルド設定](#androidstudioビルド設定)
1. [GitHub Actions設定](#github-actions設定)
1. [デフォルトのAnalyticsを無効とする](#デフォルトのanalyticsを無効とする)
1. [プロジェクト名リネーム](#手動でプロジェクト名リネーム)

## セットアップ手順

### プロジェクトのクローン
```
$ git clone https://github.com/nrikiji/flutter-starter-plus.git
```

### git管理対象外のファイルを手動で追加する
公開したくないファイルはgitの管理対象外(.gitignore)としているので手動で追加する。

#### Debugビルド用
```
firebaseコンソールからダウンロードする設定ファイル
・ios/Runner/GoogleService-Info-dev.plist
・android/app/src/debug/google-services.json
```

#### Releaseビルド用
※GitHub Actionsでのみリリースビルドする場合は不要

```
Android リリースビルドに必要なファイル
・android/app/signing/key.jks
・android/app/signing/signing.gradle

* signing.gradle の内容
signingConfigs {
  release {
     storeFile file("key.jks")
     storePassword "xxxxx"
     keyAlias "xxxxx"
     keyPassword "xxxxx"
  }
}

firebaseコンソールからダウンロードする設定ファイル
・ios/Runner/GoogleService-Info-prod.plist
・android/app/src/release/google-services.json
```

### AndroidStudioビルド設定

Android Studioの「Edit Configurations」よりdebugとreleaseを追加する

debug: 「Additional run args」に「--dart-define env=dev」を設定<br/>
<img src="https://user-images.githubusercontent.com/4780752/224581519-26629f83-240a-4073-a064-9b4e790f6121.png" width="400" />

release: 「Additional run args」に「--release --dart-define env=prod」を設定<br/>
<img src="https://user-images.githubusercontent.com/4780752/224581518-ac07126d-be0b-4a0b-956f-3eff23672f2d.png" width="400"/>

※コマンドラインでビルドする場合
```
# Debug
$ flutter build ios --dart-define=env=dev

# Release(iOS)
$ flutter build ios --release --dart-define=env=prod

# Release(Android)
$ flutter build appbundle --release --dart-define=env=prod
or
$ flutter build appbundle --release --dart-define=env=prod --no-shrink
```

### GitHub Actions設定

#### iOS(App Store)
GitHub Secretsに以下を設定
```
・APPLE_CERTIFICATES
キーチェーンアクセスから書き出したp12ファイル（iPhone Distribution:xxxxxxxxxxx(xxxxxx)）をbase64した値
$ base64 -i xxxxx.p12

・APPLE_PROFILE
プロビジョニングプロファイルをBase64した値
$ base64 -i xxxxx.mobileprovision

・ASC_ISSUER_ID
App Store Connect API > ISSUE ID

・ASC_KEY_ID
App Store Connect API > キーID

・ASC_API_KEY
App Store Connect API > APIキーファイルの内容
$ cat xxxxx.p8

・APPLE_TEAM_ID
Apple Developer チームID

・FIREBASE_IOS_GOOGLE_SERVICE_INFO(firebase)
GoogleService-Info-prod.plistをbase64した値

$ base64 -i GoogleService-Info-prod.plist
```

#### Android(Play Store)
GitHub Secretsに以下を設定
```
・ANDROID_SIGNING
リリースビルドに必要なjksファイルとgradleファイルの2ファイルをzip圧縮したファイルをbase64した値

signing(directory)
 |- key.jks
 |- signing.gradle

   * signing.gradle の内容
   signingConfigs {
     release {
        storeFile file("key.jks")
        storePassword "xxxxx"
        keyAlias "xxxxx"
        keyPassword "xxxxx"
     }
   }

$ zip -r signing.zip signing/
$ base64 -i signing.zip

・PLAYSTORE_SERVICE_ACCOUNT_JSON
Google Play Developer Publishing APIにアクセスするためのサービスアカウントを生成したときに生成される秘密鍵(JSON)をbase64した値

$ base64 -i api-xxxxx-xxxxx-xxxxx.json

・FIREBASE_ANDROID_GOOGLE_SERVICE_INFO(firebase)
google-services.jsonをbase64した値

$ base64 -i google-services.json
```

### デフォルトのAnalyticsを無効とする
ios/Runner/GoogleService-Info-prod.plist
```
<dict>
　　<key>FIREBASE_ANALYTICS_COLLECTION_ENABLED</key>
 <false></false>
</dict>
```

android/app/src/main/AndroidManifest.xml
```
<manifest xmlns:android="http://schemas.android.com/apk/res/android" ・・・>
    <application ・・・>
       <meta-data
           android:name="firebase_analytics_collection_enabled"
           android:value="false" />
    </application>
</manifest>
```

### 手動でプロジェクト名リネーム

flutter_start_appというプロジェクト名のため、適当なプロジェクト名に変更する。
変更箇所は以下を参照(flutter_start_appをstart_appに変更する例)

https://github.com/nrikiji/flutter-starter/commit/862703e5365adf55267984608bec994067a2410b

### ツールでプロジェクト名リネーム
1. `tools/config.ini`の編集
```ini:config.ini
# ホーム画面のアプリ名(デバッグ・本番)
DevAppName = Dev start_app
ProdAppName = Prod start_app

# pubspec.yaml > name のパッケージ名
FlutterProdPackageName = start_app

# iOS バンドルID(デバッグ・本番)
IOSDebugPackageName = nrikiji.start-app.dev
IOSProdPackageName = nrikiji.start-app

# iOS プロファイル名
IOSProfileName = start app

# Android バンドルID
AndroidPackageName = nrikiji.start_app
```

2. リネーム
```bash
$ dart tools/rename_project.dart
```

### Firebaseプロジェクト・アプリの作成
※`Firebase CLI`を使う場合の例

Firebaseプロジェクト作成
```bash
$ firebase projects:create --display-name "start app" start-app
```

Android アプリ作成
```bash
$ firebase apps:create android --package-name nrikiji.start_app --project start-app
```

iOS アプリ作成
```bash
$ firebase apps:create ios --bundle-id nrikiji.start-app --project start-app
```

Android 設定ファイル取得
```bash
$ firebase apps:sdkconfig --project start-app android -o android/app/src/debug/google-services.json
```

iOS 設定ファイル取得
```bash
$ firebase apps:sdkconfig --project start-app ios -o ios/Runner/GoogleService-Info-dev.plist
```
