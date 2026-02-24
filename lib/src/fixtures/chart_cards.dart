import 'dart:math';

import 'package:core/core.dart';
import 'package:uuid/uuid.dart';

/// Generates a list of predefined chart card data fixtures.
///
/// ### Data Realism
/// The data in this fixture is **procedurally generated to be plausible**.
/// It uses helper functions (`_generateTimeSeries`, `_generateCategoricalSeries`)
/// to create realistic-looking but ultimately random data points.
///
/// For categorical charts like "Views by Topic", it **does reflect real data**
/// by pulling topic names directly from `topics.dart`, ensuring consistency
/// in the demo environment.
///
/// Generates a list of predefined chart card data for fixture data.
List<ChartCardData> getChartCardsFixturesData({DateTime? now}) {
  final referenceTime = now ?? DateTime.now();
  // Use a UUID generator for creating unique IDs for fixtures.
  const uuid = Uuid();

  return [
    // --- Users Management ---
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.usersRegistrationsOverTime,
      label: {
        for (final lang in _chartLabels.keys)
          lang: _chartLabels[lang]![ChartCardId.usersRegistrationsOverTime]!,
      },
      type: ChartType.line,
      timeFrames: {
        ChartTimeFrame.week: _generateTimeSeries(referenceTime, 7, 5),
        ChartTimeFrame.month: _generateTimeSeries(referenceTime, 30, 3),
        ChartTimeFrame.year: _generateTimeSeries(referenceTime, 365, 1),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.usersActiveUsersOverTime,
      label: {
        for (final lang in _chartLabels.keys)
          lang: _chartLabels[lang]![ChartCardId.usersActiveUsersOverTime]!,
      },
      type: ChartType.line,
      timeFrames: {
        ChartTimeFrame.week: _generateTimeSeries(referenceTime, 7, 8),
        ChartTimeFrame.month: _generateTimeSeries(referenceTime, 30, 10),
        ChartTimeFrame.year: _generateTimeSeries(referenceTime, 365, 11),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.usersTierDistribution,
      label: {
        for (final lang in _chartLabels.keys)
          lang: _chartLabels[lang]![ChartCardId.usersTierDistribution]!,
      },
      type: ChartType.bar,
      timeFrames: {
        ChartTimeFrame.week: _generateCategoricalSeries([
          'Guest',
          'Standard',
        ], 10),
        ChartTimeFrame.month: _generateCategoricalSeries([
          'Guest',
          'Standard',
        ], 11),
        ChartTimeFrame.year: _generateCategoricalSeries([
          'Guest',
          'Standard',
        ], 11),
      },
    ),

    // --- Content Management: Headlines ---
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.contentHeadlinesViewsOverTime,
      label: {
        for (final lang in _chartLabels.keys)
          lang: _chartLabels[lang]![ChartCardId.contentHeadlinesViewsOverTime]!,
      },
      type: ChartType.line,
      timeFrames: {
        ChartTimeFrame.week: _generateTimeSeries(referenceTime, 7, 1500),
        ChartTimeFrame.month: _generateTimeSeries(referenceTime, 30, 1200),
        ChartTimeFrame.year: _generateTimeSeries(referenceTime, 365, 1000),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.contentHeadlinesLikesOverTime,
      label: {
        for (final lang in _chartLabels.keys)
          lang: _chartLabels[lang]![ChartCardId.contentHeadlinesLikesOverTime]!,
      },
      type: ChartType.line,
      timeFrames: {
        ChartTimeFrame.week: _generateTimeSeries(referenceTime, 7, 200),
        ChartTimeFrame.month: _generateTimeSeries(referenceTime, 30, 150),
        ChartTimeFrame.year: _generateTimeSeries(referenceTime, 365, 100),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.contentHeadlinesViewsByTopic,
      label: {
        for (final lang in _chartLabels.keys)
          lang: _chartLabels[lang]![ChartCardId.contentHeadlinesViewsByTopic]!,
      },
      type: ChartType.bar,
      timeFrames: {
        ChartTimeFrame.week: _generateCategoricalSeries(
          getTopicsFixturesData()
              .map((e) => e.name[SupportedLanguage.en]!)
              .toList(),
          5000,
        ),
        ChartTimeFrame.month: _generateCategoricalSeries(
          getTopicsFixturesData()
              .map((e) => e.name[SupportedLanguage.en]!)
              .toList(),
          20000,
        ),
        ChartTimeFrame.year: _generateCategoricalSeries(
          getTopicsFixturesData()
              .map((e) => e.name[SupportedLanguage.en]!)
              .toList(),
          240000,
        ),
      },
    ),

    // --- Content Management: Sources ---
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.contentSourcesHeadlinesPublishedOverTime,
      label: {
        for (final lang in _chartLabels.keys)
          lang:
              _chartLabels[lang]![ChartCardId
                  .contentSourcesHeadlinesPublishedOverTime]!,
      },
      type: ChartType.line,
      timeFrames: {
        ChartTimeFrame.week: _generateTimeSeries(referenceTime, 7, 15),
        ChartTimeFrame.month: _generateTimeSeries(referenceTime, 30, 12),
        ChartTimeFrame.year: _generateTimeSeries(referenceTime, 365, 10),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.contentSourcesEngagementByType,
      label: {
        for (final lang in _chartLabels.keys)
          lang:
              _chartLabels[lang]![ChartCardId.contentSourcesEngagementByType]!,
      },
      type: ChartType.bar,
      timeFrames: {
        ChartTimeFrame.week: _generateCategoricalSeries(['RSS', 'API'], 500),
        ChartTimeFrame.month: _generateCategoricalSeries(['RSS', 'API'], 2000),
        ChartTimeFrame.year: _generateCategoricalSeries(['RSS', 'API'], 24000),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.contentSourcesStatusDistribution,
      label: {
        for (final lang in _chartLabels.keys)
          lang:
              _chartLabels[lang]![ChartCardId
                  .contentSourcesStatusDistribution]!,
      },
      type: ChartType.bar,
      timeFrames: {
        ChartTimeFrame.week: _generateCategoricalSeries(
          ContentStatus.values.map((e) => e.name).toList(),
          50,
        ),
        ChartTimeFrame.month: _generateCategoricalSeries(
          ContentStatus.values.map((e) => e.name).toList(),
          200,
        ),
        ChartTimeFrame.year: _generateCategoricalSeries(
          ContentStatus.values.map((e) => e.name).toList(),
          2400,
        ),
      },
    ),

    // --- Content Management: Topics ---
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.contentHeadlinesBreakingNewsDistribution,
      label: {
        for (final lang in _chartLabels.keys)
          lang:
              _chartLabels[lang]![ChartCardId
                  .contentHeadlinesBreakingNewsDistribution]!,
      },
      type: ChartType.bar,
      timeFrames: {
        ChartTimeFrame.week: _generateCategoricalSeries([
          'Breaking',
          'Regular',
        ], 100),
        ChartTimeFrame.month: _generateCategoricalSeries([
          'Breaking',
          'Regular',
        ], 400),
        ChartTimeFrame.year: _generateCategoricalSeries([
          'Breaking',
          'Regular',
        ], 4800),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.contentTopicsHeadlinesPublishedOverTime,
      label: {
        for (final lang in _chartLabels.keys)
          lang:
              _chartLabels[lang]![ChartCardId
                  .contentTopicsHeadlinesPublishedOverTime]!,
      },
      type: ChartType.line,
      timeFrames: {
        ChartTimeFrame.week: _generateTimeSeries(referenceTime, 7, 10),
        ChartTimeFrame.month: _generateTimeSeries(referenceTime, 30, 8),
        ChartTimeFrame.year: _generateTimeSeries(referenceTime, 365, 5),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.contentTopicsEngagementByTopic,
      label: {
        for (final lang in _chartLabels.keys)
          lang:
              _chartLabels[lang]![ChartCardId.contentTopicsEngagementByTopic]!,
      },
      type: ChartType.bar,
      timeFrames: {
        ChartTimeFrame.week: _generateCategoricalSeries(
          getTopicsFixturesData()
              .map((e) => e.name[SupportedLanguage.en]!)
              .toList(),
          600,
        ),
        ChartTimeFrame.month: _generateCategoricalSeries(
          getTopicsFixturesData()
              .map((e) => e.name[SupportedLanguage.en]!)
              .toList(),
          2400,
        ),
        ChartTimeFrame.year: _generateCategoricalSeries(
          getTopicsFixturesData()
              .map((e) => e.name[SupportedLanguage.en]!)
              .toList(),
          28800,
        ),
      },
    ),

    // --- Engagements Management ---
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.engagementsReactionsOverTime,
      label: {
        for (final lang in _chartLabels.keys)
          lang: _chartLabels[lang]![ChartCardId.engagementsReactionsOverTime]!,
      },
      type: ChartType.line,
      timeFrames: {
        ChartTimeFrame.week: _generateTimeSeries(referenceTime, 7, 10),
        ChartTimeFrame.month: _generateTimeSeries(referenceTime, 30, 8),
        ChartTimeFrame.year: _generateTimeSeries(referenceTime, 365, 5),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.engagementsCommentsOverTime,
      label: {
        for (final lang in _chartLabels.keys)
          lang: _chartLabels[lang]![ChartCardId.engagementsCommentsOverTime]!,
      },
      type: ChartType.line,
      timeFrames: {
        ChartTimeFrame.week: _generateTimeSeries(referenceTime, 7, 5),
        ChartTimeFrame.month: _generateTimeSeries(referenceTime, 30, 4),
        ChartTimeFrame.year: _generateTimeSeries(referenceTime, 365, 2),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.engagementsReactionsByType,
      label: {
        for (final lang in _chartLabels.keys)
          lang: _chartLabels[lang]![ChartCardId.engagementsReactionsByType]!,
      },
      type: ChartType.bar,
      timeFrames: {
        ChartTimeFrame.week: _generateCategoricalSeries([
          'like',
          'love',
          'laugh',
        ], 20),
        ChartTimeFrame.month: _generateCategoricalSeries([
          'like',
          'love',
          'laugh',
        ], 80),
        ChartTimeFrame.year: _generateCategoricalSeries([
          'like',
          'love',
          'laugh',
        ], 960),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.engagementsReportsSubmittedOverTime,
      label: {
        for (final lang in _chartLabels.keys)
          lang:
              _chartLabels[lang]![ChartCardId
                  .engagementsReportsSubmittedOverTime]!,
      },
      type: ChartType.line,
      timeFrames: {
        ChartTimeFrame.week: _generateTimeSeries(referenceTime, 7, 2),
        ChartTimeFrame.month: _generateTimeSeries(referenceTime, 30, 1),
        ChartTimeFrame.year: _generateTimeSeries(referenceTime, 365, 0),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.engagementsReportsResolutionTimeOverTime,
      label: {
        for (final lang in _chartLabels.keys)
          lang:
              _chartLabels[lang]![ChartCardId
                  .engagementsReportsResolutionTimeOverTime]!,
      },
      type: ChartType.line,
      timeFrames: {
        ChartTimeFrame.week: _generateTimeSeries(referenceTime, 7, 24), // Hours
        ChartTimeFrame.month: _generateTimeSeries(referenceTime, 30, 48),
        ChartTimeFrame.year: _generateTimeSeries(referenceTime, 365, 72),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.engagementsReportsByReason,
      label: {
        for (final lang in _chartLabels.keys)
          lang: _chartLabels[lang]![ChartCardId.engagementsReportsByReason]!,
      },
      type: ChartType.bar,
      timeFrames: {
        ChartTimeFrame.week: _generateCategoricalSeries([
          'Spam',
          'Hate Speech',
        ], 5),
        ChartTimeFrame.month: _generateCategoricalSeries([
          'Spam',
          'Hate Speech',
        ], 20),
        ChartTimeFrame.year: _generateCategoricalSeries([
          'Spam',
          'Hate Speech',
        ], 240),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.engagementsAppReviewsFeedbackOverTime,
      label: {
        for (final lang in _chartLabels.keys)
          lang:
              _chartLabels[lang]![ChartCardId
                  .engagementsAppReviewsFeedbackOverTime]!,
      },
      type: ChartType.line,
      timeFrames: {
        ChartTimeFrame.week: _generateTimeSeries(referenceTime, 7, 3),
        ChartTimeFrame.month: _generateTimeSeries(referenceTime, 30, 2),
        ChartTimeFrame.year: _generateTimeSeries(referenceTime, 365, 1),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.engagementsAppReviewsPositiveVsNegative,
      label: {
        for (final lang in _chartLabels.keys)
          lang:
              _chartLabels[lang]![ChartCardId
                  .engagementsAppReviewsPositiveVsNegative]!,
      },
      type: ChartType.bar,
      timeFrames: {
        ChartTimeFrame.week: _generateCategoricalSeries([
          'Positive',
          'Negative',
        ], 5),
        ChartTimeFrame.month: _generateCategoricalSeries([
          'Positive',
          'Negative',
        ], 20),
        ChartTimeFrame.year: _generateCategoricalSeries([
          'Positive',
          'Negative',
        ], 240),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.engagementsAppReviewsStoreRequestsOverTime,
      label: {
        for (final lang in _chartLabels.keys)
          lang:
              _chartLabels[lang]![ChartCardId
                  .engagementsAppReviewsStoreRequestsOverTime]!,
      },
      type: ChartType.line,
      timeFrames: {
        ChartTimeFrame.week: _generateTimeSeries(referenceTime, 7, 1),
        ChartTimeFrame.month: _generateTimeSeries(referenceTime, 30, 1),
        ChartTimeFrame.year: _generateTimeSeries(referenceTime, 365, 0),
      },
    ),

    // --- Rewards Management ---
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.rewardsAdsWatchedOverTime,
      label: {
        for (final lang in _chartLabels.keys)
          lang: _chartLabels[lang]![ChartCardId.rewardsAdsWatchedOverTime]!,
      },
      type: ChartType.line,
      timeFrames: {
        ChartTimeFrame.week: _generateTimeSeries(referenceTime, 7, 50),
        ChartTimeFrame.month: _generateTimeSeries(referenceTime, 30, 40),
        ChartTimeFrame.year: _generateTimeSeries(referenceTime, 365, 30),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.rewardsGrantedOverTime,
      label: {
        for (final lang in _chartLabels.keys)
          lang: _chartLabels[lang]![ChartCardId.rewardsGrantedOverTime]!,
      },
      type: ChartType.line,
      timeFrames: {
        ChartTimeFrame.week: _generateTimeSeries(referenceTime, 7, 48),
        ChartTimeFrame.month: _generateTimeSeries(referenceTime, 30, 38),
        ChartTimeFrame.year: _generateTimeSeries(referenceTime, 365, 28),
      },
    ),
    ChartCardData(
      id: uuid.v4(),
      cardId: ChartCardId.rewardsActiveByType,
      label: {
        for (final lang in _chartLabels.keys)
          lang: _chartLabels[lang]![ChartCardId.rewardsActiveByType]!,
      },
      type: ChartType.bar,
      timeFrames: {
        ChartTimeFrame.week: _generateCategoricalSeries([
          'Ad-Free',
          'Daily Digest',
        ], 50),
        ChartTimeFrame.month: _generateCategoricalSeries([
          'Ad-Free',
          'Daily Digest',
        ], 150),
        ChartTimeFrame.year: _generateCategoricalSeries([
          'Ad-Free',
          'Daily Digest',
        ], 500),
      },
    ),
  ];
}

/// Generates a list of [DataPoint]s for a time-series chart (e.g., a line chart).
///
/// It creates a data point for each day over the specified number of [days],
/// working backwards from the [now] timestamp. Each data point is assigned a
/// random value, calculated to be within a plausible range based on [maxValue].
///
/// - [now]: The reference time, typically `DateTime.now()`.
/// - [days]: The number of days to generate data for (e.g., 7 for a week).
/// - [maxValue]: The upper bound for the random value generation.
List<DataPoint> _generateTimeSeries(DateTime now, int days, int maxValue) {
  final random = Random();
  return List.generate(days, (i) {
    final value = maxValue > 0 ? random.nextInt(maxValue) + maxValue * 0.2 : 0;
    return DataPoint(
      timestamp: now.subtract(Duration(days: days - 1 - i)),
      value: value,
    );
  });
}

/// Generates a list of [DataPoint]s for a categorical chart (e.g., a bar chart).
///
/// It iterates through a list of [categories] (e.g., topic names) and creates
/// a `DataPoint` for each one, assigning it a random value up to [max].
///
/// - [categories]: A list of strings representing the categories for the x-axis.
/// - [max]: The upper bound for the random value generation for each category.
List<DataPoint> _generateCategoricalSeries(List<String> categories, int max) {
  final random = Random();
  return categories
      .map(
        (category) =>
            DataPoint(label: category, value: random.nextInt(max) + max * 0.1),
      )
      .toList();
}

/// A map containing the display labels for each chart card in all supported languages.
final Map<SupportedLanguage, Map<ChartCardId, String>> _chartLabels = {
  SupportedLanguage.en: {
    // Users
    ChartCardId.usersRegistrationsOverTime: 'Registrations Over Time',
    ChartCardId.usersActiveUsersOverTime: 'Active Users Over Time',
    ChartCardId.usersTierDistribution: 'User Tier Distribution',
    // Headlines
    ChartCardId.contentHeadlinesViewsOverTime: 'Views Over Time',
    ChartCardId.contentHeadlinesLikesOverTime: 'Likes Over Time',
    ChartCardId.contentHeadlinesViewsByTopic: 'Views by Topic',
    // Sources
    ChartCardId.contentSourcesHeadlinesPublishedOverTime:
        'Headlines Published Over Time',
    ChartCardId.contentSourcesStatusDistribution: 'Source Status Distribution',
    ChartCardId.contentSourcesEngagementByType: 'Engagement by Source Type',
    // Topics
    ChartCardId.contentHeadlinesBreakingNewsDistribution:
        'Breaking News Distribution',
    ChartCardId.contentTopicsHeadlinesPublishedOverTime:
        'Headlines Published Over Time',
    ChartCardId.contentTopicsEngagementByTopic: 'Engagement by Topic',
    // Engagements
    ChartCardId.engagementsReactionsOverTime: 'Reactions Over Time',
    ChartCardId.engagementsCommentsOverTime: 'Comments Over Time',
    ChartCardId.engagementsReactionsByType: 'Reactions by Type',
    // Reports
    ChartCardId.engagementsReportsSubmittedOverTime:
        'Reports Submitted Over Time',
    ChartCardId.engagementsReportsResolutionTimeOverTime:
        'Avg. Resolution Time Over Time',
    ChartCardId.engagementsReportsByReason: 'Reports by Reason',
    // App Reviews
    ChartCardId.engagementsAppReviewsFeedbackOverTime: 'Feedback Over Time',
    ChartCardId.engagementsAppReviewsPositiveVsNegative:
        'Positive vs. Negative Feedback',
    ChartCardId.engagementsAppReviewsStoreRequestsOverTime:
        'Store Requests Over Time',
    ChartCardId.rewardsAdsWatchedOverTime: 'Ads Watched Over Time',
    ChartCardId.rewardsGrantedOverTime: 'Rewards Granted Over Time',
    ChartCardId.rewardsActiveByType: 'Active Rewards by Type',
  },
  SupportedLanguage.ar: {
    // Users
    ChartCardId.usersRegistrationsOverTime: 'التسجيلات عبر الزمن',
    ChartCardId.usersActiveUsersOverTime: 'المستخدمون النشطون عبر الزمن',
    ChartCardId.usersTierDistribution: 'توزيع مستويات المستخدمين',
    // Headlines
    ChartCardId.contentHeadlinesViewsOverTime: 'المشاهدات عبر الزمن',
    ChartCardId.contentHeadlinesLikesOverTime: 'الإعجابات عبر الزمن',
    ChartCardId.contentHeadlinesViewsByTopic: 'المشاهدات حسب الموضوع',
    // Sources
    ChartCardId.contentSourcesHeadlinesPublishedOverTime:
        'العناوين المنشورة عبر الزمن',
    ChartCardId.contentSourcesStatusDistribution: 'توزيع حالة المصادر',
    ChartCardId.contentSourcesEngagementByType: 'التفاعل حسب نوع المصدر',
    // Topics
    ChartCardId.contentHeadlinesBreakingNewsDistribution:
        'توزيع الأخبار العاجلة',
    ChartCardId.contentTopicsHeadlinesPublishedOverTime:
        'العناوين المنشورة عبر الزمن',
    ChartCardId.contentTopicsEngagementByTopic: 'التفاعل حسب الموضوع',
    // Engagements
    ChartCardId.engagementsReactionsOverTime: 'التفاعلات عبر الزمن',
    ChartCardId.engagementsCommentsOverTime: 'التعليقات عبر الزمن',
    ChartCardId.engagementsReactionsByType: 'التفاعلات حسب النوع',
    // Reports
    ChartCardId.engagementsReportsSubmittedOverTime:
        'التقارير المقدمة عبر الزمن',
    ChartCardId.engagementsReportsResolutionTimeOverTime:
        'متوسط وقت حل التقارير عبر الزمن',
    ChartCardId.engagementsReportsByReason: 'التقارير حسب السبب',
    // App Reviews
    ChartCardId.engagementsAppReviewsFeedbackOverTime: 'التقييمات عبر الزمن',
    ChartCardId.engagementsAppReviewsPositiveVsNegative:
        'التقييمات الإيجابية مقابل السلبية',
    ChartCardId.engagementsAppReviewsStoreRequestsOverTime:
        'طلبات تقييم المتجر عبر الزمن',
    ChartCardId.rewardsAdsWatchedOverTime: 'الإعلانات المشاهدة عبر الزمن',
    ChartCardId.rewardsGrantedOverTime: 'المكافآت الممنوحة عبر الزمن',
    ChartCardId.rewardsActiveByType: 'المكافآت النشطة حسب النوع',
  },
  SupportedLanguage.es: {
    ChartCardId.usersRegistrationsOverTime: 'Registros a lo largo del tiempo',
    ChartCardId.usersActiveUsersOverTime:
        'Usuarios activos a lo largo del tiempo',
    ChartCardId.usersTierDistribution: 'Distribución de niveles de usuario',
    ChartCardId.contentHeadlinesViewsOverTime: 'Vistas a lo largo del tiempo',
    ChartCardId.contentHeadlinesLikesOverTime: 'Me gusta a lo largo del tiempo',
    ChartCardId.contentHeadlinesViewsByTopic: 'Vistas por tema',
    ChartCardId.contentSourcesHeadlinesPublishedOverTime:
        'Titulares publicados a lo largo del tiempo',
    ChartCardId.contentSourcesStatusDistribution:
        'Distribución del estado de la fuente',
    ChartCardId.contentSourcesEngagementByType:
        'Participación por tipo de fuente',
    ChartCardId.contentHeadlinesBreakingNewsDistribution:
        'Distribución de noticias de última hora',
    ChartCardId.contentTopicsHeadlinesPublishedOverTime:
        'Titulares publicados a lo largo del tiempo',
    ChartCardId.contentTopicsEngagementByTopic: 'Participación por tema',
    ChartCardId.engagementsReactionsOverTime:
        'Reacciones a lo largo del tiempo',
    ChartCardId.engagementsCommentsOverTime:
        'Comentarios a lo largo del tiempo',
    ChartCardId.engagementsReactionsByType: 'Reacciones por tipo',
    ChartCardId.engagementsReportsSubmittedOverTime:
        'Informes enviados a lo largo del tiempo',
    ChartCardId.engagementsReportsResolutionTimeOverTime:
        'Tiempo medio de resolución a lo largo del tiempo',
    ChartCardId.engagementsReportsByReason: 'Informes por motivo',
    ChartCardId.engagementsAppReviewsFeedbackOverTime:
        'Comentarios a lo largo del tiempo',
    ChartCardId.engagementsAppReviewsPositiveVsNegative:
        'Comentarios positivos vs. negativos',
    ChartCardId.engagementsAppReviewsStoreRequestsOverTime:
        'Solicitudes de tienda a lo largo del tiempo',
    ChartCardId.rewardsAdsWatchedOverTime:
        'Anuncios vistos a lo largo del tiempo',
    ChartCardId.rewardsGrantedOverTime:
        'Recompensas otorgadas a lo largo del tiempo',
    ChartCardId.rewardsActiveByType: 'Recompensas activas por tipo',
  },
  SupportedLanguage.fr: {
    ChartCardId.usersRegistrationsOverTime: 'Inscriptions au fil du temps',
    ChartCardId.usersActiveUsersOverTime: 'Utilisateurs actifs au fil du temps',
    ChartCardId.usersTierDistribution: "Répartition des niveaux d'utilisateurs",
    ChartCardId.contentHeadlinesViewsOverTime: 'Vues au fil du temps',
    ChartCardId.contentHeadlinesLikesOverTime: "J'aime au fil du temps",
    ChartCardId.contentHeadlinesViewsByTopic: 'Vues par sujet',
    ChartCardId.contentSourcesHeadlinesPublishedOverTime:
        'Titres publiés au fil du temps',
    ChartCardId.contentSourcesStatusDistribution:
        'Répartition du statut des sources',
    ChartCardId.contentSourcesEngagementByType: 'Engagement par type de source',
    ChartCardId.contentHeadlinesBreakingNewsDistribution:
        'Répartition des dernières nouvelles',
    ChartCardId.contentTopicsHeadlinesPublishedOverTime:
        'Titres publiés au fil du temps',
    ChartCardId.contentTopicsEngagementByTopic: 'Engagement par sujet',
    ChartCardId.engagementsReactionsOverTime: 'Réactions au fil du temps',
    ChartCardId.engagementsCommentsOverTime: 'Commentaires au fil du temps',
    ChartCardId.engagementsReactionsByType: 'Réactions par type',
    ChartCardId.engagementsReportsSubmittedOverTime:
        'Rapports soumis au fil du temps',
    ChartCardId.engagementsReportsResolutionTimeOverTime:
        'Temps de résolution moyen au fil du temps',
    ChartCardId.engagementsReportsByReason: 'Rapports par raison',
    ChartCardId.engagementsAppReviewsFeedbackOverTime:
        'Commentaires au fil du temps',
    ChartCardId.engagementsAppReviewsPositiveVsNegative:
        'Commentaires positifs vs négatifs',
    ChartCardId.engagementsAppReviewsStoreRequestsOverTime:
        'Demandes de magasin au fil du temps',
    ChartCardId.rewardsAdsWatchedOverTime:
        'Publicités regardées au fil du temps',
    ChartCardId.rewardsGrantedOverTime: 'Récompenses accordées au fil du temps',
    ChartCardId.rewardsActiveByType: 'Récompenses actives par type',
  },
  SupportedLanguage.pt: {
    ChartCardId.usersRegistrationsOverTime: 'Registros ao longo do tempo',
    ChartCardId.usersActiveUsersOverTime: 'Usuários ativos ao longo do tempo',
    ChartCardId.usersTierDistribution: 'Distribuição de níveis de usuário',
    ChartCardId.contentHeadlinesViewsOverTime:
        'Visualizações ao longo do tempo',
    ChartCardId.contentHeadlinesLikesOverTime: 'Curtidas ao longo do tempo',
    ChartCardId.contentHeadlinesViewsByTopic: 'Visualizações por tópico',
    ChartCardId.contentSourcesHeadlinesPublishedOverTime:
        'Manchetes publicadas ao longo do tempo',
    ChartCardId.contentSourcesStatusDistribution:
        'Distribuição de status da fonte',
    ChartCardId.contentSourcesEngagementByType: 'Engajamento por tipo de fonte',
    ChartCardId.contentHeadlinesBreakingNewsDistribution:
        'Distribuição de notícias de última hora',
    ChartCardId.contentTopicsHeadlinesPublishedOverTime:
        'Manchetes publicadas ao longo do tempo',
    ChartCardId.contentTopicsEngagementByTopic: 'Engajamento por tópico',
    ChartCardId.engagementsReactionsOverTime: 'Reações ao longo do tempo',
    ChartCardId.engagementsCommentsOverTime: 'Comentários ao longo do tempo',
    ChartCardId.engagementsReactionsByType: 'Reações por tipo',
    ChartCardId.engagementsReportsSubmittedOverTime:
        'Denúncias enviadas ao longo do tempo',
    ChartCardId.engagementsReportsResolutionTimeOverTime:
        'Tempo médio de resolução ao longo do tempo',
    ChartCardId.engagementsReportsByReason: 'Denúncias por motivo',
    ChartCardId.engagementsAppReviewsFeedbackOverTime:
        'Feedback ao longo do tempo',
    ChartCardId.engagementsAppReviewsPositiveVsNegative:
        'Feedback positivo vs. negativo',
    ChartCardId.engagementsAppReviewsStoreRequestsOverTime:
        'Solicitações da loja ao longo do tempo',
    ChartCardId.rewardsAdsWatchedOverTime:
        'Anúncios assistidos ao longo do tempo',
    ChartCardId.rewardsGrantedOverTime:
        'Recompensas concedidas ao longo do tempo',
    ChartCardId.rewardsActiveByType: 'Recompensas ativas por tipo',
  },
  SupportedLanguage.de: {
    ChartCardId.usersRegistrationsOverTime: 'Registrierungen im Zeitverlauf',
    ChartCardId.usersActiveUsersOverTime: 'Aktive Benutzer im Zeitverlauf',
    ChartCardId.usersTierDistribution: 'Verteilung der Benutzerebenen',
    ChartCardId.contentHeadlinesViewsOverTime: 'Ansichten im Zeitverlauf',
    ChartCardId.contentHeadlinesLikesOverTime: 'Likes im Zeitverlauf',
    ChartCardId.contentHeadlinesViewsByTopic: 'Ansichten nach Thema',
    ChartCardId.contentSourcesHeadlinesPublishedOverTime:
        'Veröffentlichte Schlagzeilen im Zeitverlauf',
    ChartCardId.contentSourcesStatusDistribution:
        'Verteilung des Quellenstatus',
    ChartCardId.contentSourcesEngagementByType: 'Engagement nach Quellentyp',
    ChartCardId.contentHeadlinesBreakingNewsDistribution:
        'Verteilung der Eilmeldungen',
    ChartCardId.contentTopicsHeadlinesPublishedOverTime:
        'Veröffentlichte Schlagzeilen im Zeitverlauf',
    ChartCardId.contentTopicsEngagementByTopic: 'Engagement nach Thema',
    ChartCardId.engagementsReactionsOverTime: 'Reaktionen im Zeitverlauf',
    ChartCardId.engagementsCommentsOverTime: 'Kommentare im Zeitverlauf',
    ChartCardId.engagementsReactionsByType: 'Reaktionen nach Typ',
    ChartCardId.engagementsReportsSubmittedOverTime:
        'Eingereichte Berichte im Zeitverlauf',
    ChartCardId.engagementsReportsResolutionTimeOverTime:
        'Durchschn. Lösungszeit im Zeitverlauf',
    ChartCardId.engagementsReportsByReason: 'Berichte nach Grund',
    ChartCardId.engagementsAppReviewsFeedbackOverTime:
        'Feedback im Zeitverlauf',
    ChartCardId.engagementsAppReviewsPositiveVsNegative:
        'Positives vs. Negatives Feedback',
    ChartCardId.engagementsAppReviewsStoreRequestsOverTime:
        'Store-Anfragen im Zeitverlauf',
    ChartCardId.rewardsAdsWatchedOverTime: 'Angesehene Anzeigen im Zeitverlauf',
    ChartCardId.rewardsGrantedOverTime: 'Gewährte Belohnungen im Zeitverlauf',
    ChartCardId.rewardsActiveByType: 'Aktive Belohnungen nach Typ',
  },
  SupportedLanguage.it: {
    ChartCardId.usersRegistrationsOverTime: 'Registrazioni nel tempo',
    ChartCardId.usersActiveUsersOverTime: 'Utenti attivi nel tempo',
    ChartCardId.usersTierDistribution: 'Distribuzione dei livelli utente',
    ChartCardId.contentHeadlinesViewsOverTime: 'Visualizzazioni nel tempo',
    ChartCardId.contentHeadlinesLikesOverTime: 'Mi piace nel tempo',
    ChartCardId.contentHeadlinesViewsByTopic: 'Visualizzazioni per argomento',
    ChartCardId.contentSourcesHeadlinesPublishedOverTime:
        'Titoli pubblicati nel tempo',
    ChartCardId.contentSourcesStatusDistribution:
        'Distribuzione dello stato della fonte',
    ChartCardId.contentSourcesEngagementByType:
        'Coinvolgimento per tipo di fonte',
    ChartCardId.contentHeadlinesBreakingNewsDistribution:
        'Distribuzione delle ultime notizie',
    ChartCardId.contentTopicsHeadlinesPublishedOverTime:
        'Titoli pubblicati nel tempo',
    ChartCardId.contentTopicsEngagementByTopic: 'Coinvolgimento per argomento',
    ChartCardId.engagementsReactionsOverTime: 'Reazioni nel tempo',
    ChartCardId.engagementsCommentsOverTime: 'Commenti nel tempo',
    ChartCardId.engagementsReactionsByType: 'Reazioni per tipo',
    ChartCardId.engagementsReportsSubmittedOverTime:
        'Segnalazioni inviate nel tempo',
    ChartCardId.engagementsReportsResolutionTimeOverTime:
        'Tempo medio di risoluzione nel tempo',
    ChartCardId.engagementsReportsByReason: 'Segnalazioni per motivo',
    ChartCardId.engagementsAppReviewsFeedbackOverTime: 'Feedback nel tempo',
    ChartCardId.engagementsAppReviewsPositiveVsNegative:
        'Feedback positivo vs. negativo',
    ChartCardId.engagementsAppReviewsStoreRequestsOverTime:
        'Richieste dello store nel tempo',
    ChartCardId.rewardsAdsWatchedOverTime: 'Annunci guardati nel tempo',
    ChartCardId.rewardsGrantedOverTime: 'Ricompense concesse nel tempo',
    ChartCardId.rewardsActiveByType: 'Ricompense attive per tipo',
  },
  SupportedLanguage.zh: {
    ChartCardId.usersRegistrationsOverTime: '随时间变化的注册',
    ChartCardId.usersActiveUsersOverTime: '随时间变化的活跃用户',
    ChartCardId.usersTierDistribution: '用户层级分布',
    ChartCardId.contentHeadlinesViewsOverTime: '随时间变化的浏览量',
    ChartCardId.contentHeadlinesLikesOverTime: '随时间变化的点赞数',
    ChartCardId.contentHeadlinesViewsByTopic: '按主题浏览',
    ChartCardId.contentSourcesHeadlinesPublishedOverTime: '随时间发布的头条新闻',
    ChartCardId.contentSourcesStatusDistribution: '来源状态分布',
    ChartCardId.contentSourcesEngagementByType: '按来源类型参与',
    ChartCardId.contentHeadlinesBreakingNewsDistribution: '突发新闻分布',
    ChartCardId.contentTopicsHeadlinesPublishedOverTime: '随时间发布的头条新闻',
    ChartCardId.contentTopicsEngagementByTopic: '按主题参与',
    ChartCardId.engagementsReactionsOverTime: '随时间变化的反应',
    ChartCardId.engagementsCommentsOverTime: '随时间变化的评论',
    ChartCardId.engagementsReactionsByType: '按类型反应',
    ChartCardId.engagementsReportsSubmittedOverTime: '随时间提交的报告',
    ChartCardId.engagementsReportsResolutionTimeOverTime: '随时间变化的平均解决时间',
    ChartCardId.engagementsReportsByReason: '按原因报告',
    ChartCardId.engagementsAppReviewsFeedbackOverTime: '随时间变化的反馈',
    ChartCardId.engagementsAppReviewsPositiveVsNegative: '正面与负面反馈',
    ChartCardId.engagementsAppReviewsStoreRequestsOverTime: '随时间变化的商店请求',
    ChartCardId.rewardsAdsWatchedOverTime: '随时间观看的广告',
    ChartCardId.rewardsGrantedOverTime: '随时间发放的奖励',
    ChartCardId.rewardsActiveByType: '按类型活跃奖励',
  },
  SupportedLanguage.hi: {
    ChartCardId.usersRegistrationsOverTime: 'समय के साथ पंजीकरण',
    ChartCardId.usersActiveUsersOverTime: 'समय के साथ सक्रिय उपयोगकर्ता',
    ChartCardId.usersTierDistribution: 'उपयोगकर्ता स्तर वितरण',
    ChartCardId.contentHeadlinesViewsOverTime: 'समय के साथ दृश्य',
    ChartCardId.contentHeadlinesLikesOverTime: 'समय के साथ पसंद',
    ChartCardId.contentHeadlinesViewsByTopic: 'विषय के अनुसार दृश्य',
    ChartCardId.contentSourcesHeadlinesPublishedOverTime:
        'समय के साथ प्रकाशित सुर्खियाँ',
    ChartCardId.contentSourcesStatusDistribution: 'स्रोत स्थिति वितरण',
    ChartCardId.contentSourcesEngagementByType: 'स्रोत प्रकार द्वारा जुड़ाव',
    ChartCardId.contentHeadlinesBreakingNewsDistribution:
        'ब्रेकिंग न्यूज़ वितरण',
    ChartCardId.contentTopicsHeadlinesPublishedOverTime:
        'समय के साथ प्रकाशित सुर्खियाँ',
    ChartCardId.contentTopicsEngagementByTopic: 'विषय द्वारा जुड़ाव',
    ChartCardId.engagementsReactionsOverTime: 'समय के साथ प्रतिक्रियाएँ',
    ChartCardId.engagementsCommentsOverTime: 'समय के साथ टिप्पणियाँ',
    ChartCardId.engagementsReactionsByType: 'प्रकार द्वारा प्रतिक्रियाएँ',
    ChartCardId.engagementsReportsSubmittedOverTime:
        'समय के साथ प्रस्तुत रिपोर्ट',
    ChartCardId.engagementsReportsResolutionTimeOverTime:
        'समय के साथ औसत समाधान समय',
    ChartCardId.engagementsReportsByReason: 'कारण द्वारा रिपोर्ट',
    ChartCardId.engagementsAppReviewsFeedbackOverTime: 'समय के साथ प्रतिक्रिया',
    ChartCardId.engagementsAppReviewsPositiveVsNegative:
        'सकारात्मक बनाम नकारात्मक प्रतिक्रिया',
    ChartCardId.engagementsAppReviewsStoreRequestsOverTime:
        'समय के साथ स्टोर अनुरोध',
    ChartCardId.rewardsAdsWatchedOverTime: 'समय के साथ देखे गए विज्ञापन',
    ChartCardId.rewardsGrantedOverTime: 'समय के साथ दिए गए पुरस्कार',
    ChartCardId.rewardsActiveByType: 'प्रकार द्वारा सक्रिय पुरस्कार',
  },
  SupportedLanguage.ja: {
    ChartCardId.usersRegistrationsOverTime: '時間の経過に伴う登録',
    ChartCardId.usersActiveUsersOverTime: '時間の経過に伴うアクティブユーザー',
    ChartCardId.usersTierDistribution: 'ユーザー層の分布',
    ChartCardId.contentHeadlinesViewsOverTime: '時間の経過に伴う閲覧数',
    ChartCardId.contentHeadlinesLikesOverTime: '時間の経過に伴ういいね数',
    ChartCardId.contentHeadlinesViewsByTopic: 'トピック別の閲覧数',
    ChartCardId.contentSourcesHeadlinesPublishedOverTime: '時間の経過に伴う公開された見出し',
    ChartCardId.contentSourcesStatusDistribution: 'ソースステータスの分布',
    ChartCardId.contentSourcesEngagementByType: 'ソースタイプ別のエンゲージメント',
    ChartCardId.contentHeadlinesBreakingNewsDistribution: 'ニュース速報の分布',
    ChartCardId.contentTopicsHeadlinesPublishedOverTime: '時間の経過に伴う公開された見出し',
    ChartCardId.contentTopicsEngagementByTopic: 'トピック別のエンゲージメント',
    ChartCardId.engagementsReactionsOverTime: '時間の経過に伴うリアクション',
    ChartCardId.engagementsCommentsOverTime: '時間の経過に伴うコメント',
    ChartCardId.engagementsReactionsByType: 'タイプ別のリアクション',
    ChartCardId.engagementsReportsSubmittedOverTime: '時間の経過に伴う提出されたレポート',
    ChartCardId.engagementsReportsResolutionTimeOverTime: '時間の経過に伴う平均解決時間',
    ChartCardId.engagementsReportsByReason: '理由別のレポート',
    ChartCardId.engagementsAppReviewsFeedbackOverTime: '時間の経過に伴うフィードバック',
    ChartCardId.engagementsAppReviewsPositiveVsNegative:
        'ポジティブなフィードバックとネガティブなフィードバック',
    ChartCardId.engagementsAppReviewsStoreRequestsOverTime: '時間の経過に伴うストアリクエスト',
    ChartCardId.rewardsAdsWatchedOverTime: '時間の経過に伴う視聴された広告',
    ChartCardId.rewardsGrantedOverTime: '時間の経過に伴う付与された報酬',
    ChartCardId.rewardsActiveByType: 'タイプ別のアクティブな報酬',
  },
};
