// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../model/user_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserAction _$$_UserActionFromJson(Map<String, dynamic> json) =>
    _$_UserAction(
      launchCount: json['launchCount'] as int? ?? 0,
      reviewStatus:
          $enumDecodeNullable(_$ReviewStatusEnumMap, json['reviewStatus']) ??
              ReviewStatus.cancel,
    );

Map<String, dynamic> _$$_UserActionToJson(_$_UserAction instance) =>
    <String, dynamic>{
      'launchCount': instance.launchCount,
      'reviewStatus': _$ReviewStatusEnumMap[instance.reviewStatus]!,
    };

const _$ReviewStatusEnumMap = {
  ReviewStatus.ok: 'ok',
  ReviewStatus.cancel: 'cancel',
  ReviewStatus.deny: 'deny',
};
