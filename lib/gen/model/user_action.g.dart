// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../../model/user_action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserActionImpl _$$UserActionImplFromJson(Map<String, dynamic> json) =>
    _$UserActionImpl(
      launchCount: (json['launchCount'] as num?)?.toInt() ?? 0,
      reviewStatus:
          $enumDecodeNullable(_$ReviewStatusEnumMap, json['reviewStatus']) ??
              ReviewStatus.cancel,
    );

Map<String, dynamic> _$$UserActionImplToJson(_$UserActionImpl instance) =>
    <String, dynamic>{
      'launchCount': instance.launchCount,
      'reviewStatus': _$ReviewStatusEnumMap[instance.reviewStatus]!,
    };

const _$ReviewStatusEnumMap = {
  ReviewStatus.ok: 'ok',
  ReviewStatus.cancel: 'cancel',
  ReviewStatus.deny: 'deny',
};
