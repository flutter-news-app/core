// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_automation_task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsAutomationTask _$NewsAutomationTaskFromJson(Map<String, dynamic> json) =>
    $checkedCreate('NewsAutomationTask', json, ($checkedConvert) {
      final val = NewsAutomationTask(
        id: $checkedConvert('id', (v) => v as String),
        sourceId: $checkedConvert('sourceId', (v) => v as String),
        fetchInterval: $checkedConvert(
          'fetchInterval',
          (v) => $enumDecode(_$FetchIntervalEnumMap, v),
        ),
        status: $checkedConvert(
          'status',
          (v) => $enumDecode(_$IngestionStatusEnumMap, v),
        ),
        createdAt: $checkedConvert(
          'createdAt',
          (v) => const DateTimeConverter().fromJson(v as String),
        ),
        updatedAt: $checkedConvert(
          'updatedAt',
          (v) => const DateTimeConverter().fromJson(v as String),
        ),
        lastRunAt: $checkedConvert(
          'lastRunAt',
          (v) => const NullableDateTimeConverter().fromJson(v as String?),
        ),
        nextRunAt: $checkedConvert(
          'nextRunAt',
          (v) => const NullableDateTimeConverter().fromJson(v as String?),
        ),
        failureCount: $checkedConvert(
          'failureCount',
          (v) => (v as num?)?.toInt() ?? 0,
        ),
        lastErrorMessage: $checkedConvert(
          'lastErrorMessage',
          (v) => v as String?,
        ),
      );
      return val;
    });

Map<String, dynamic> _$NewsAutomationTaskToJson(NewsAutomationTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sourceId': instance.sourceId,
      'fetchInterval': _$FetchIntervalEnumMap[instance.fetchInterval]!,
      'status': _$IngestionStatusEnumMap[instance.status]!,
      'lastRunAt': const NullableDateTimeConverter().toJson(instance.lastRunAt),
      'nextRunAt': const NullableDateTimeConverter().toJson(instance.nextRunAt),
      'failureCount': instance.failureCount,
      'lastErrorMessage': instance.lastErrorMessage,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
    };

const _$FetchIntervalEnumMap = {
  FetchInterval.every15Minutes: 'every15Minutes',
  FetchInterval.every30Minutes: 'every30Minutes',
  FetchInterval.hourly: 'hourly',
  FetchInterval.everySixHours: 'everySixHours',
  FetchInterval.daily: 'daily',
};

const _$IngestionStatusEnumMap = {
  IngestionStatus.active: 'active',
  IngestionStatus.paused: 'paused',
  IngestionStatus.error: 'error',
};
