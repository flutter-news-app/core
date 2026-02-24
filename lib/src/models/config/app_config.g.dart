// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppConfig _$AppConfigFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AppConfig', json, ($checkedConvert) {
      final val = AppConfig(
        maintenance: $checkedConvert(
          'maintenance',
          (v) => MaintenanceConfig.fromJson(v as Map<String, dynamic>),
        ),
        update: $checkedConvert(
          'update',
          (v) => UpdateConfig.fromJson(v as Map<String, dynamic>),
        ),
        general: $checkedConvert(
          'general',
          (v) => GeneralAppConfig.fromJson(v as Map<String, dynamic>),
        ),
        localization: $checkedConvert(
          'localization',
          (v) => LocalizationConfig.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AppConfigToJson(AppConfig instance) => <String, dynamic>{
  'maintenance': instance.maintenance.toJson(),
  'update': instance.update.toJson(),
  'general': instance.general.toJson(),
  'localization': instance.localization.toJson(),
};
