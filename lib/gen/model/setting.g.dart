// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../model/setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Setting _$$_SettingFromJson(Map<String, dynamic> json) => _$_Setting(
      theme: $enumDecodeNullable(_$ThemeEnumMap, json['theme']) ?? Theme.system,
      lang: $enumDecodeNullable(_$LangEnumMap, json['lang']) ?? Lang.system,
    );

Map<String, dynamic> _$$_SettingToJson(_$_Setting instance) =>
    <String, dynamic>{
      'theme': _$ThemeEnumMap[instance.theme]!,
      'lang': _$LangEnumMap[instance.lang]!,
    };

const _$ThemeEnumMap = {
  Theme.system: 'system',
  Theme.light: 'light',
  Theme.dark: 'dark',
};

const _$LangEnumMap = {
  Lang.system: 'system',
  Lang.ja: 'ja',
  Lang.en: 'en',
};
