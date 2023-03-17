import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_start_app/enum/lang.dart';
import 'package:flutter_start_app/enum/theme.dart';

part 'gen/setting.freezed.dart';
part 'gen/setting.g.dart';

@freezed
class Setting with _$Setting {
  const factory Setting({
    @Default(Theme.system) Theme theme,
    @Default(Lang.system) Lang lang,
  }) = _Setting;

  factory Setting.fromJson(Map<String, dynamic> json) => _$SettingFromJson(json);
}
