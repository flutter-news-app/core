// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Person',
  json,
  ($checkedConvert) {
    final val = Person(
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
      imageUrl: $checkedConvert('imageUrl', (v) => v as String?),
      mediaAssetId: $checkedConvert('mediaAssetId', (v) => v as String?),
    );
    return val;
  },
);

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name.map(
    (k, e) => MapEntry(_$SupportedLanguageEnumMap[k]!, e),
  ),
  'description': instance.description.map(
    (k, e) => MapEntry(_$SupportedLanguageEnumMap[k]!, e),
  ),
  'createdAt': const DateTimeConverter().toJson(instance.createdAt),
  'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
  'status': _$ContentStatusEnumMap[instance.status]!,
  'imageUrl': ?instance.imageUrl,
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

const _$ContentStatusEnumMap = {
  ContentStatus.active: 'active',
  ContentStatus.draft: 'draft',
  ContentStatus.archived: 'archived',
  ContentStatus.ingested: 'ingested',
};
