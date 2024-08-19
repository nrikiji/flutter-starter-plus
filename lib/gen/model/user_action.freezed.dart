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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserAction _$UserActionFromJson(Map<String, dynamic> json) {
  return _UserAction.fromJson(json);
}

/// @nodoc
mixin _$UserAction {
  int get launchCount => throw _privateConstructorUsedError;
  ReviewStatus get reviewStatus => throw _privateConstructorUsedError;

  /// Serializes this UserAction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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

  /// Create a copy of UserAction
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$UserActionImplCopyWith<$Res>
    implements $UserActionCopyWith<$Res> {
  factory _$$UserActionImplCopyWith(
          _$UserActionImpl value, $Res Function(_$UserActionImpl) then) =
      __$$UserActionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int launchCount, ReviewStatus reviewStatus});
}

/// @nodoc
class __$$UserActionImplCopyWithImpl<$Res>
    extends _$UserActionCopyWithImpl<$Res, _$UserActionImpl>
    implements _$$UserActionImplCopyWith<$Res> {
  __$$UserActionImplCopyWithImpl(
      _$UserActionImpl _value, $Res Function(_$UserActionImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserAction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? launchCount = null,
    Object? reviewStatus = null,
  }) {
    return _then(_$UserActionImpl(
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
class _$UserActionImpl with DiagnosticableTreeMixin implements _UserAction {
  const _$UserActionImpl(
      {this.launchCount = 0, this.reviewStatus = ReviewStatus.cancel});

  factory _$UserActionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserActionImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserActionImpl &&
            (identical(other.launchCount, launchCount) ||
                other.launchCount == launchCount) &&
            (identical(other.reviewStatus, reviewStatus) ||
                other.reviewStatus == reviewStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, launchCount, reviewStatus);

  /// Create a copy of UserAction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserActionImplCopyWith<_$UserActionImpl> get copyWith =>
      __$$UserActionImplCopyWithImpl<_$UserActionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserActionImplToJson(
      this,
    );
  }
}

abstract class _UserAction implements UserAction {
  const factory _UserAction(
      {final int launchCount,
      final ReviewStatus reviewStatus}) = _$UserActionImpl;

  factory _UserAction.fromJson(Map<String, dynamic> json) =
      _$UserActionImpl.fromJson;

  @override
  int get launchCount;
  @override
  ReviewStatus get reviewStatus;

  /// Create a copy of UserAction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserActionImplCopyWith<_$UserActionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
