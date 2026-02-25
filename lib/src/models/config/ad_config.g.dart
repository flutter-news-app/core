// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdConfig _$AdConfigFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdConfig', json, ($checkedConvert) {
      final val = AdConfig(
        enabled: $checkedConvert('enabled', (v) => v as bool),
        primaryAdPlatform: $checkedConvert(
          'primaryAdPlatform',
          (v) => $enumDecode(_$AdPlatformTypeEnumMap, v),
        ),
        platformAdIdentifiers: $checkedConvert(
          'platformAdIdentifiers',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(
              $enumDecode(_$AdPlatformTypeEnumMap, k),
              AdPlatformIdentifiers.fromJson(e as Map<String, dynamic>),
            ),
          ),
        ),
        feedAdConfiguration: $checkedConvert(
          'feedAdConfiguration',
          (v) => FeedAdConfiguration.fromJson(v as Map<String, dynamic>),
        ),
        navigationAdConfiguration: $checkedConvert(
          'navigationAdConfiguration',
          (v) => NavigationAdConfiguration.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AdConfigToJson(AdConfig instance) => <String, dynamic>{
  'enabled': instance.enabled,
  'primaryAdPlatform': _$AdPlatformTypeEnumMap[instance.primaryAdPlatform]!,
  'platformAdIdentifiers': instance.platformAdIdentifiers.map(
    (k, e) => MapEntry(_$AdPlatformTypeEnumMap[k]!, e.toJson()),
  ),
  'feedAdConfiguration': instance.feedAdConfiguration.toJson(),
  'navigationAdConfiguration': instance.navigationAdConfiguration.toJson(),
};

const _$AdPlatformTypeEnumMap = {AdPlatformType.admob: 'admob'};
