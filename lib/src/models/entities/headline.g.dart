// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Headline _$HeadlineFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Headline',
  json,
  ($checkedConvert) {
    final val = Headline(
      id: $checkedConvert('id', (v) => v as String),
      title: $checkedConvert(
        'title',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) =>
              MapEntry($enumDecode(_$SupportedLanguageEnumMap, k), e as String),
        ),
      ),
      url: $checkedConvert('url', (v) => v as String),
      source: $checkedConvert(
        'source',
        (v) => Source.fromJson(v as Map<String, dynamic>),
      ),
      topic: $checkedConvert(
        'topic',
        (v) => Topic.fromJson(v as Map<String, dynamic>),
      ),
      createdAt: $checkedConvert(
        'createdAt',
        (v) => const DateTimeConverter().fromJson(v as String),
      ),
      updatedAt: $checkedConvert(
        'updatedAt',
        (v) => const DateTimeConverter().fromJson(v as String),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$ContentStatusEnumMap, v),
      ),
      isBreaking: $checkedConvert('isBreaking', (v) => v as bool),
      mentionedCountries: $checkedConvert(
        'mentionedCountries',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
      mentionedPersons: $checkedConvert(
        'mentionedPersons',
        (v) =>
            (v as List<dynamic>?)
                ?.map((e) => Person.fromJson(e as Map<String, dynamic>))
                .toList() ??
            const [],
      ),
      imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
      mediaAssetId: $checkedConvert('mediaAssetId', (v) => v as String?),
    );
    return val;
  },
);

Map<String, dynamic> _$HeadlineToJson(Headline instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title.map(
    (k, e) => MapEntry(_$SupportedLanguageEnumMap[k]!, e),
  ),
  'url': instance.url,
  'imageUrl': ?instance.imageUrl,
  'source': instance.source.toJson(),
  'createdAt': const DateTimeConverter().toJson(instance.createdAt),
  'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
  'status': _$ContentStatusEnumMap[instance.status]!,
  'isBreaking': instance.isBreaking,
  'topic': instance.topic.toJson(),
  'mediaAssetId': ?instance.mediaAssetId,
  'mentionedCountries': instance.mentionedCountries
      .map((e) => e.toJson())
      .toList(),
  'mentionedPersons': instance.mentionedPersons.map((e) => e.toJson()).toList(),
};

const _$SupportedLanguageEnumMap = {
  SupportedLanguage.en: 'en',
  SupportedLanguage.es: 'es',
  SupportedLanguage.fr: 'fr',
  SupportedLanguage.ar: 'ar',
  SupportedLanguage.pt: 'pt',
  SupportedLanguage.de: 'de',
  SupportedLanguage.it: 'it',
  SupportedLanguage.zh: 'zh',
  SupportedLanguage.hi: 'hi',
  SupportedLanguage.ja: 'ja',
};

const _$ContentStatusEnumMap = {
  ContentStatus.active: 'active',
  ContentStatus.draft: 'draft',
  ContentStatus.archived: 'archived',
  ContentStatus.ingested: 'ingested',
};
