import 'package:flutter/foundation.dart';
import 'package:flutter_start_app/model/lang.dart';
import 'package:flutter_start_app/model/theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting.freezed.dart';
part 'setting.g.dart';

@freezed
class Setting with _$Setting {
  const factory Setting({
    @Default(Theme.system) Theme theme,
    @Default(Lang.system) Lang lang,
  }) = _Setting;

  factory Setting.fromJson(Map<String, dynamic> json) => _$SettingFromJson(json);
}
