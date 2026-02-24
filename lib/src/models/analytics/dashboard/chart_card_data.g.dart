// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chart_card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChartCardData _$ChartCardDataFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ChartCardData', json, ($checkedConvert) {
  final val = ChartCardData(
    id: $checkedConvert('id', (v) => v as String),
    cardId: $checkedConvert(
      'cardId',
      (v) => $enumDecode(_$ChartCardIdEnumMap, v),
    ),
    label: $checkedConvert(
      'label',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry($enumDecode(_$SupportedLanguageEnumMap, k), e as String),
      ),
    ),
    type: $checkedConvert('type', (v) => $enumDecode(_$ChartTypeEnumMap, v)),
    timeFrames: $checkedConvert(
      'timeFrames',
      (v) => (v as Map<String, dynamic>).map(
        (k, e) => MapEntry(
          $enumDecode(_$ChartTimeFrameEnumMap, k),
          (e as List<dynamic>)
              .map((e) => DataPoint.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
    ),
  );
  return val;
});

Map<String, dynamic> _$ChartCardDataToJson(ChartCardData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardId': _$ChartCardIdEnumMap[instance.cardId]!,
      'label': instance.label.map(
        (k, e) => MapEntry(_$SupportedLanguageEnumMap[k]!, e),
      ),
      'type': _$ChartTypeEnumMap[instance.type]!,
      'timeFrames': instance.timeFrames.map(
        (k, e) => MapEntry(
          _$ChartTimeFrameEnumMap[k]!,
          e.map((e) => e.toJson()).toList(),
        ),
      ),
    };

const _$ChartCardIdEnumMap = {
  ChartCardId.overviewAppTourFunnel: 'overviewAppTourFunnel',
  ChartCardId.overviewInitialPersonalizationFunnel:
      'overviewInitialPersonalizationFunnel',
  ChartCardId.usersRegistrationsOverTime: 'usersRegistrationsOverTime',
  ChartCardId.usersActiveUsersOverTime: 'usersActiveUsersOverTime',
  ChartCardId.usersTierDistribution: 'usersTierDistribution',
  ChartCardId.contentHeadlinesViewsOverTime: 'contentHeadlinesViewsOverTime',
  ChartCardId.contentHeadlinesLikesOverTime: 'contentHeadlinesLikesOverTime',
  ChartCardId.contentHeadlinesViewsByTopic: 'contentHeadlinesViewsByTopic',
  ChartCardId.contentSourcesHeadlinesPublishedOverTime:
      'contentSourcesHeadlinesPublishedOverTime',
  ChartCardId.contentSourcesStatusDistribution:
      'contentSourcesStatusDistribution',
  ChartCardId.contentSourcesEngagementByType: 'contentSourcesEngagementByType',
  ChartCardId.contentHeadlinesBreakingNewsDistribution:
      'contentHeadlinesBreakingNewsDistribution',
  ChartCardId.contentTopicsHeadlinesPublishedOverTime:
      'contentTopicsHeadlinesPublishedOverTime',
  ChartCardId.contentTopicsEngagementByTopic: 'contentTopicsEngagementByTopic',
  ChartCardId.engagementsReactionsOverTime: 'engagementsReactionsOverTime',
  ChartCardId.engagementsCommentsOverTime: 'engagementsCommentsOverTime',
  ChartCardId.engagementsReactionsByType: 'engagementsReactionsByType',
  ChartCardId.engagementsReportsSubmittedOverTime:
      'engagementsReportsSubmittedOverTime',
  ChartCardId.engagementsReportsResolutionTimeOverTime:
      'engagementsReportsResolutionTimeOverTime',
  ChartCardId.engagementsReportsByReason: 'engagementsReportsByReason',
  ChartCardId.engagementsAppReviewsFeedbackOverTime:
      'engagementsAppReviewsFeedbackOverTime',
  ChartCardId.engagementsAppReviewsPositiveVsNegative:
      'engagementsAppReviewsPositiveVsNegative',
  ChartCardId.engagementsAppReviewsStoreRequestsOverTime:
      'engagementsAppReviewsStoreRequestsOverTime',
  ChartCardId.rewardsAdsWatchedOverTime: 'rewardsAdsWatchedOverTime',
  ChartCardId.rewardsGrantedOverTime: 'rewardsGrantedOverTime',
  ChartCardId.rewardsActiveByType: 'rewardsActiveByType',
  ChartCardId.mediaUploadsOverTime: 'mediaUploadsOverTime',
  ChartCardId.mediaUploadsByPurpose: 'mediaUploadsByPurpose',
  ChartCardId.mediaUploadsSuccessVsFailure: 'mediaUploadsSuccessVsFailure',
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

const _$ChartTypeEnumMap = {ChartType.line: 'line', ChartType.bar: 'bar'};

const _$ChartTimeFrameEnumMap = {
  ChartTimeFrame.week: 'week',
  ChartTimeFrame.month: 'month',
  ChartTimeFrame.year: 'year',
};
