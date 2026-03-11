// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headline_filter_criteria.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeadlineFilterCriteria _$HeadlineFilterCriteriaFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('HeadlineFilterCriteria', json, ($checkedConvert) {
  final val = HeadlineFilterCriteria(
    topics: $checkedConvert(
      'topics',
      (v) => (v as List<dynamic>)
          .map((e) => Topic.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    sources: $checkedConvert(
      'sources',
      (v) => (v as List<dynamic>)
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    countries: $checkedConvert(
      'countries',
      (v) => (v as List<dynamic>)
          .map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    persons: $checkedConvert(
      'persons',
      (v) => (v as List<dynamic>)
          .map((e) => Person.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$HeadlineFilterCriteriaToJson(
  HeadlineFilterCriteria instance,
) => <String, dynamic>{
  'topics': instance.topics.map((e) => e.toJson()).toList(),
  'sources': instance.sources.map((e) => e.toJson()).toList(),
  'countries': instance.countries.map((e) => e.toJson()).toList(),
  'persons': instance.persons.map((e) => e.toJson()).toList(),
};
