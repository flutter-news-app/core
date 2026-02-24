// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranked_list_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankedListItem _$RankedListItemFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RankedListItem', json, ($checkedConvert) {
      final val = RankedListItem(
        entityId: $checkedConvert('entityId', (v) => v as String),
        displayTitle: $checkedConvert(
          'displayTitle',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(
              $enumDecode(_$SupportedLanguageEnumMap, k),
              e as String,
            ),
          ),
        ),
        metricValue: $checkedConvert('metricValue', (v) => v as num),
      );
      return val;
    });

Map<String, dynamic> _$RankedListItemToJson(RankedListItem instance) =>
    <String, dynamic>{
      'entityId': instance.entityId,
      'displayTitle': instance.displayTitle.map(
        (k, e) => MapEntry(_$SupportedLanguageEnumMap[k]!, e),
      ),
      'metricValue': instance.metricValue,
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
