// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_collection_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentCollectionItem<T> _$ContentCollectionItemFromJson<T extends FeedItem>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => $checkedCreate('ContentCollectionItem', json, ($checkedConvert) {
  final val = ContentCollectionItem<T>(
    id: $checkedConvert('id', (v) => v as String),
    decoratorType: $checkedConvert(
      'decoratorType',
      (v) => $enumDecode(_$FeedDecoratorTypeEnumMap, v),
    ),
    title: $checkedConvert(
      'title',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry($enumDecode(_$SupportedLanguageEnumMap, k), e as String),
      ),
    ),
    items: $checkedConvert(
      'items',
      (v) => (v as List<dynamic>).map(fromJsonT).toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ContentCollectionItemToJson<T extends FeedItem>(
  ContentCollectionItem<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'id': instance.id,
  'decoratorType': _$FeedDecoratorTypeEnumMap[instance.decoratorType]!,
  'title': instance.title.map(
    (k, e) => MapEntry(_$SupportedLanguageEnumMap[k]!, e),
  ),
  'items': instance.items.map(toJsonT).toList(),
};

const _$FeedDecoratorTypeEnumMap = {
  FeedDecoratorType.linkAccount: 'linkAccount',
  FeedDecoratorType.unlockRewards: 'unlockRewards',
  FeedDecoratorType.rateApp: 'rateApp',
  FeedDecoratorType.suggestedTopics: 'suggestedTopics',
  FeedDecoratorType.suggestedSources: 'suggestedSources',
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
