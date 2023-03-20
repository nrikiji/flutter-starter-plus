// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../provider/app_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppState {
  bool get initialized => throw _privateConstructorUsedError;
  Setting get setting => throw _privateConstructorUsedError;
  UserAction get userAction => throw _privateConstructorUsedError;
  String? get appVersion => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {bool initialized,
      Setting setting,
      UserAction userAction,
      String? appVersion});

  $SettingCopyWith<$Res> get setting;
  $UserActionCopyWith<$Res> get userAction;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialized = null,
    Object? setting = null,
    Object? userAction = null,
    Object? appVersion = freezed,
  }) {
    return _then(_value.copyWith(
      initialized: null == initialized
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      setting: null == setting
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as Setting,
      userAction: null == userAction
          ? _value.userAction
          : userAction // ignore: cast_nullable_to_non_nullable
              as UserAction,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SettingCopyWith<$Res> get setting {
    return $SettingCopyWith<$Res>(_value.setting, (value) {
      return _then(_value.copyWith(setting: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserActionCopyWith<$Res> get userAction {
    return $UserActionCopyWith<$Res>(_value.userAction, (value) {
      return _then(_value.copyWith(userAction: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppStateCopyWith<$Res> implements $AppStateCopyWith<$Res> {
  factory _$$_AppStateCopyWith(
          _$_AppState value, $Res Function(_$_AppState) then) =
      __$$_AppStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool initialized,
      Setting setting,
      UserAction userAction,
      String? appVersion});

  @override
  $SettingCopyWith<$Res> get setting;
  @override
  $UserActionCopyWith<$Res> get userAction;
}

/// @nodoc
class __$$_AppStateCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$_AppState>
    implements _$$_AppStateCopyWith<$Res> {
  __$$_AppStateCopyWithImpl(
      _$_AppState _value, $Res Function(_$_AppState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialized = null,
    Object? setting = null,
    Object? userAction = null,
    Object? appVersion = freezed,
  }) {
    return _then(_$_AppState(
      initialized: null == initialized
          ? _value.initialized
          : initialized // ignore: cast_nullable_to_non_nullable
              as bool,
      setting: null == setting
          ? _value.setting
          : setting // ignore: cast_nullable_to_non_nullable
              as Setting,
      userAction: null == userAction
          ? _value.userAction
          : userAction // ignore: cast_nullable_to_non_nullable
              as UserAction,
      appVersion: freezed == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AppState implements _AppState {
  _$_AppState(
      {this.initialized = false,
      this.setting = const Setting(),
      this.userAction = const UserAction(),
      this.appVersion});

  @override
  @JsonKey()
  final bool initialized;
  @override
  @JsonKey()
  final Setting setting;
  @override
  @JsonKey()
  final UserAction userAction;
  @override
  final String? appVersion;

  @override
  String toString() {
    return 'AppState(initialized: $initialized, setting: $setting, userAction: $userAction, appVersion: $appVersion)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppState &&
            (identical(other.initialized, initialized) ||
                other.initialized == initialized) &&
            (identical(other.setting, setting) || other.setting == setting) &&
            (identical(other.userAction, userAction) ||
                other.userAction == userAction) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, initialized, setting, userAction, appVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      __$$_AppStateCopyWithImpl<_$_AppState>(this, _$identity);
}

abstract class _AppState implements AppState {
  factory _AppState(
      {final bool initialized,
      final Setting setting,
      final UserAction userAction,
      final String? appVersion}) = _$_AppState;

  @override
  bool get initialized;
  @override
  Setting get setting;
  @override
  UserAction get userAction;
  @override
  String? get appVersion;
  @override
  @JsonKey(ignore: true)
  _$$_AppStateCopyWith<_$_AppState> get copyWith =>
      throw _privateConstructorUsedError;
}
