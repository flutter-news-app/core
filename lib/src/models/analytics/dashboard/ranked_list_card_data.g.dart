// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranked_list_card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RankedListCardData _$RankedListCardDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('RankedListCardData', json, ($checkedConvert) {
  final val = RankedListCardData(
    id: $checkedConvert('id', (v) => v as String),
    cardId: $checkedConvert(
      'cardId',
      (v) => $enumDecode(_$RankedListCardIdEnumMap, v),
    ),
    label: $checkedConvert(
      'label',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry($enumDecode(_$SupportedLanguageEnumMap, k), e as String),
      ),
    ),
    timeFrames: $checkedConvert(
      'timeFrames',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          $enumDecode(_$RankedListTimeFrameEnumMap, k),
          (e as List<dynamic>)
              .map((e) => RankedListItem.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
    ),
  );
  return val;
});

Map<String, dynamic> _$RankedListCardDataToJson(RankedListCardData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardId': _$RankedListCardIdEnumMap[instance.cardId]!,
      'label': instance.label.map(
        (k, e) => MapEntry(_$SupportedLanguageEnumMap[k]!, e),
      ),
      'timeFrames': instance.timeFrames.map(
        (k, e) => MapEntry(
          _$RankedListTimeFrameEnumMap[k]!,
          e.map((e) => e.toJson()).toList(),
        ),
      ),
    };

const _$RankedListCardIdEnumMap = {
  RankedListCardId.overviewHeadlinesMostViewed: 'overviewHeadlinesMostViewed',
  RankedListCardId.overviewHeadlinesMostLiked: 'overviewHeadlinesMostLiked',
  RankedListCardId.overviewSourcesMostFollowed: 'overviewSourcesMostFollowed',
  RankedListCardId.overviewTopicsMostFollowed: 'overviewTopicsMostFollowed',
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

const _$RankedListTimeFrameEnumMap = {
  RankedListTimeFrame.day: 'day',
  RankedListTimeFrame.week: 'week',
  RankedListTimeFrame.month: 'month',
  RankedListTimeFrame.year: 'year',
};
