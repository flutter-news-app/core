// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'source.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Source _$SourceFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Source',
  json,
  ($checkedConvert) {
    final val = Source(
      id: $checkedConvert('id', (v) => v as String),
      name: $checkedConvert(
        'name',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) =>
              MapEntry($enumDecode(_$SupportedLanguageEnumMap, k), e as String),
        ),
      ),
      description: $checkedConvert(
        'description',
        (v) => (v as Map<String, dynamic>).map(
          (k, e) =>
              MapEntry($enumDecode(_$SupportedLanguageEnumMap, k), e as String),
        ),
      ),
      url: $checkedConvert('url', (v) => v as String),
      sourceType: $checkedConvert(
        'sourceType',
        (v) => $enumDecode(_$SourceTypeEnumMap, v),
      ),
      language: $checkedConvert(
        'language',
        (v) => $enumDecode(_$SupportedLanguageEnumMap, v),
      ),
      headquarters: $checkedConvert(
        'headquarters',
        (v) => Country.fromJson(v as Map<String, dynamic>),
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
      logoUrl: $checkedConvert('logoUrl', (v) => v as String?),
      mediaAssetId: $checkedConvert('mediaAssetId', (v) => v as String?),
    );
    return val;
  },
);

Map<String, dynamic> _$SourceToJson(Source instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name.map(
    (k, e) => MapEntry(_$SupportedLanguageEnumMap[k]!, e),
  ),
  'description': instance.description.map(
    (k, e) => MapEntry(_$SupportedLanguageEnumMap[k]!, e),
  ),
  'url': instance.url,
  'logoUrl': ?instance.logoUrl,
  'sourceType': _$SourceTypeEnumMap[instance.sourceType]!,
  'language': _$SupportedLanguageEnumMap[instance.language]!,
  'headquarters': instance.headquarters.toJson(),
  'createdAt': const DateTimeConverter().toJson(instance.createdAt),
  'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
  'status': _$ContentStatusEnumMap[instance.status]!,
  'mediaAssetId': ?instance.mediaAssetId,
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

const _$SourceTypeEnumMap = {
  SourceType.newsAgency: 'newsAgency',
  SourceType.localNewsOutlet: 'localNewsOutlet',
  SourceType.nationalNewsOutlet: 'nationalNewsOutlet',
  SourceType.internationalNewsOutlet: 'internationalNewsOutlet',
  SourceType.specializedPublisher: 'specializedPublisher',
  SourceType.blog: 'blog',
  SourceType.governmentSource: 'governmentSource',
  SourceType.aggregator: 'aggregator',
  SourceType.other: 'other',
};

const _$ContentStatusEnumMap = {
  ContentStatus.active: 'active',
  ContentStatus.draft: 'draft',
  ContentStatus.archived: 'archived',
  ContentStatus.ingested: 'ingested',
};
