import 'package:flutter/foundation.dart';
import 'package:flutter_start_app/enum/review_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../gen/model/user_action.freezed.dart';
part '../gen/model/user_action.g.dart';

@freezed
class UserAction with _$UserAction {
  const factory UserAction({
    @Default(0) int launchCount,
    @Default(ReviewStatus.cancel) ReviewStatus reviewStatus,
  }) = _UserAction;

  factory UserAction.fromJson(Map<String, dynamic> json) => _$UserActionFromJson(json);
}
