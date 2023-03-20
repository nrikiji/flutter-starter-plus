// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../../model/user_action.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserAction _$UserActionFromJson(Map<String, dynamic> json) {
  return _UserAction.fromJson(json);
}

/// @nodoc
mixin _$UserAction {
  int get launchCount => throw _privateConstructorUsedError;
  ReviewStatus get reviewStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserActionCopyWith<UserAction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserActionCopyWith<$Res> {
  factory $UserActionCopyWith(
          UserAction value, $Res Function(UserAction) then) =
      _$UserActionCopyWithImpl<$Res, UserAction>;
  @useResult
  $Res call({int launchCount, ReviewStatus reviewStatus});
}

/// @nodoc
class _$UserActionCopyWithImpl<$Res, $Val extends UserAction>
    implements $UserActionCopyWith<$Res> {
  _$UserActionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? launchCount = null,
    Object? reviewStatus = null,
  }) {
    return _then(_value.copyWith(
      launchCount: null == launchCount
          ? _value.launchCount
          : launchCount // ignore: cast_nullable_to_non_nullable
              as int,
      reviewStatus: null == reviewStatus
          ? _value.reviewStatus
          : reviewStatus // ignore: cast_nullable_to_non_nullable
              as ReviewStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserActionCopyWith<$Res>
    implements $UserActionCopyWith<$Res> {
  factory _$$_UserActionCopyWith(
          _$_UserAction value, $Res Function(_$_UserAction) then) =
      __$$_UserActionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int launchCount, ReviewStatus reviewStatus});
}

/// @nodoc
class __$$_UserActionCopyWithImpl<$Res>
    extends _$UserActionCopyWithImpl<$Res, _$_UserAction>
    implements _$$_UserActionCopyWith<$Res> {
  __$$_UserActionCopyWithImpl(
      _$_UserAction _value, $Res Function(_$_UserAction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? launchCount = null,
    Object? reviewStatus = null,
  }) {
    return _then(_$_UserAction(
      launchCount: null == launchCount
          ? _value.launchCount
          : launchCount // ignore: cast_nullable_to_non_nullable
              as int,
      reviewStatus: null == reviewStatus
          ? _value.reviewStatus
          : reviewStatus // ignore: cast_nullable_to_non_nullable
              as ReviewStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserAction with DiagnosticableTreeMixin implements _UserAction {
  const _$_UserAction(
      {this.launchCount = 0, this.reviewStatus = ReviewStatus.cancel});

  factory _$_UserAction.fromJson(Map<String, dynamic> json) =>
      _$$_UserActionFromJson(json);

  @override
  @JsonKey()
  final int launchCount;
  @override
  @JsonKey()
  final ReviewStatus reviewStatus;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserAction(launchCount: $launchCount, reviewStatus: $reviewStatus)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserAction'))
      ..add(DiagnosticsProperty('launchCount', launchCount))
      ..add(DiagnosticsProperty('reviewStatus', reviewStatus));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserAction &&
            (identical(other.launchCount, launchCount) ||
                other.launchCount == launchCount) &&
            (identical(other.reviewStatus, reviewStatus) ||
                other.reviewStatus == reviewStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, launchCount, reviewStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserActionCopyWith<_$_UserAction> get copyWith =>
      __$$_UserActionCopyWithImpl<_$_UserAction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserActionToJson(
      this,
    );
  }
}

abstract class _UserAction implements UserAction {
  const factory _UserAction(
      {final int launchCount, final ReviewStatus reviewStatus}) = _$_UserAction;

  factory _UserAction.fromJson(Map<String, dynamic> json) =
      _$_UserAction.fromJson;

  @override
  int get launchCount;
  @override
  ReviewStatus get reviewStatus;
  @override
  @JsonKey(ignore: true)
  _$$_UserActionCopyWith<_$_UserAction> get copyWith =>
      throw _privateConstructorUsedError;
}
