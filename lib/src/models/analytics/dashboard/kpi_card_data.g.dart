// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kpi_card_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KpiTimeFrameData _$KpiTimeFrameDataFromJson(Map<String, dynamic> json) =>
    $checkedCreate('KpiTimeFrameData', json, ($checkedConvert) {
      final val = KpiTimeFrameData(
        value: $checkedConvert('value', (v) => v as num),
        trend: $checkedConvert('trend', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$KpiTimeFrameDataToJson(KpiTimeFrameData instance) =>
    <String, dynamic>{'value': instance.value, 'trend': instance.trend};

KpiCardData _$KpiCardDataFromJson(Map<String, dynamic> json) => $checkedCreate(
  'KpiCardData',
  json,
  ($checkedConvert) {
    final val = KpiCardData(
      id: $checkedConvert('id', (v) => v as String),
      cardId: $checkedConvert(
        'cardId',
        (v) => $enumDecode(_$KpiCardIdEnumMap, v),
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
            $enumDecode(_$KpiTimeFrameEnumMap, k),
            KpiTimeFrameData.fromJson(e as Map<String, dynamic>),
          ),
        ),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$KpiCardDataToJson(KpiCardData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cardId': _$KpiCardIdEnumMap[instance.cardId]!,
      'label': instance.label.map(
        (k, e) => MapEntry(_$SupportedLanguageEnumMap[k]!, e),
      ),
      'timeFrames': instance.timeFrames.map(
        (k, e) => MapEntry(_$KpiTimeFrameEnumMap[k]!, e.toJson()),
      ),
    };

const _$KpiCardIdEnumMap = {
  KpiCardId.usersTotalRegistered: 'usersTotalRegistered',
  KpiCardId.usersNewRegistrations: 'usersNewRegistrations',
  KpiCardId.usersActiveUsers: 'usersActiveUsers',
  KpiCardId.contentHeadlinesTotalPublished: 'contentHeadlinesTotalPublished',
  KpiCardId.contentHeadlinesTotalViews: 'contentHeadlinesTotalViews',
  KpiCardId.contentHeadlinesTotalLikes: 'contentHeadlinesTotalLikes',
  KpiCardId.contentSourcesTotalSources: 'contentSourcesTotalSources',
  KpiCardId.contentSourcesNewSources: 'contentSourcesNewSources',
  KpiCardId.contentSourcesTotalFollowers: 'contentSourcesTotalFollowers',
  KpiCardId.contentTopicsTotalTopics: 'contentTopicsTotalTopics',
  KpiCardId.contentTopicsNewTopics: 'contentTopicsNewTopics',
  KpiCardId.contentTopicsTotalFollowers: 'contentTopicsTotalFollowers',
  KpiCardId.engagementsTotalReactions: 'engagementsTotalReactions',
  KpiCardId.engagementsTotalComments: 'engagementsTotalComments',
  KpiCardId.engagementsAverageEngagementRate:
      'engagementsAverageEngagementRate',
  KpiCardId.engagementsReportsPending: 'engagementsReportsPending',
  KpiCardId.engagementsReportsResolved: 'engagementsReportsResolved',
  KpiCardId.engagementsReportsAverageResolutionTime:
      'engagementsReportsAverageResolutionTime',
  KpiCardId.engagementsAppReviewsTotalFeedback:
      'engagementsAppReviewsTotalFeedback',
  KpiCardId.engagementsAppReviewsPositiveFeedback:
      'engagementsAppReviewsPositiveFeedback',
  KpiCardId.engagementsAppReviewsStoreRequests:
      'engagementsAppReviewsStoreRequests',
  KpiCardId.rewardsAdsWatchedTotal: 'rewardsAdsWatchedTotal',
  KpiCardId.rewardsGrantedTotal: 'rewardsGrantedTotal',
  KpiCardId.rewardsActiveUsersCount: 'rewardsActiveUsersCount',
  KpiCardId.mediaTotalUploads: 'mediaTotalUploads',
  KpiCardId.mediaFailedUploads: 'mediaFailedUploads',
  KpiCardId.mediaAverageUploadTime: 'mediaAverageUploadTime',
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

const _$KpiTimeFrameEnumMap = {
  KpiTimeFrame.day: 'day',
  KpiTimeFrame.week: 'week',
  KpiTimeFrame.month: 'month',
  KpiTimeFrame.year: 'year',
};
