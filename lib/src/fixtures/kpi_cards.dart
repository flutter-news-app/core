import 'package:core/src/enums/enums.dart';
import 'package:core/src/models/analytics/dashboard/kpi_card_data.dart';
import 'package:uuid/uuid.dart';

/// Generates a list of predefined KPI card data fixtures.
///
/// ### Data Realism
/// The data in this fixture is designed to be **plausible but hardcoded**.
/// It does not perform real-time calculations based on other fixtures.
/// Instead, it provides static, representative numbers that simulate what a
/// real backend would pre-calculate.
///
/// For example, `usersTotalRegistered` has a value of `11` because there are
/// 11 users in `users.dart`, but the trend data is entirely fabricated for
/// demonstration purposes. This approach ensures the dashboard UI can be
/// showcased with realistic-looking metrics without complex client-side logic.
List<KpiCardData> getKpiCardsFixturesData() {
  const uuid = Uuid();

  return [
    // --- Users Management ---
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.usersTotalRegistered,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.usersTotalRegistered]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 11, trend: '+2'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 11, trend: '+5'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 11, trend: '+8'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 11, trend: '+11'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.usersNewRegistrations,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.usersNewRegistrations]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 2, trend: '+1'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 5, trend: '-1'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 8, trend: '+3'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 11, trend: '+11'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.usersActiveUsers,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.usersActiveUsers]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 8, trend: '+15%'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 10, trend: '+5%'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 11, trend: '+2%'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 11, trend: '0%'),
      },
    ),

    // --- Content Management: Headlines ---
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.contentHeadlinesTotalPublished,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.contentHeadlinesTotalPublished]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 100, trend: '+10'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 100, trend: '+30'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 100, trend: '+70'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 100, trend: '+100'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.contentHeadlinesTotalViews,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.contentHeadlinesTotalViews]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 1250, trend: '+5.2%'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 8750, trend: '+3.1%'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 35000, trend: '+1.8%'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 420000, trend: '+1.2%'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.contentHeadlinesTotalLikes,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.contentHeadlinesTotalLikes]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 230, trend: '+8%'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 1610, trend: '+4.5%'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 6440, trend: '+2.2%'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 77280, trend: '+1.5%'),
      },
    ),

    // --- Content Management: Sources ---
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.contentSourcesTotalSources,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.contentSourcesTotalSources]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 90, trend: '+1'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 90, trend: '+5'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 90, trend: '+12'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 90, trend: '+90'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.contentSourcesNewSources,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.contentSourcesNewSources]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 1, trend: '0'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 5, trend: '+2'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 12, trend: '-3'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 90, trend: '+90'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.contentSourcesTotalFollowers,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.contentSourcesTotalFollowers]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 1850, trend: '+25'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 1850, trend: '+150'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 1850, trend: '+500'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 1850, trend: '+1850'),
      },
    ),

    // --- Content Management: Topics ---
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.contentTopicsTotalTopics,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.contentTopicsTotalTopics]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 10, trend: '0'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 10, trend: '+1'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 10, trend: '+3'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 10, trend: '+10'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.contentTopicsNewTopics,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.contentTopicsNewTopics]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 0, trend: '0'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 1, trend: '+1'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 3, trend: '0'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 10, trend: '+10'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.contentTopicsTotalFollowers,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.contentTopicsTotalFollowers]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 3200, trend: '+50'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 3200, trend: '+300'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 3200, trend: '+1000'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 3200, trend: '+3200'),
      },
    ),

    // --- Engagements Management ---
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.engagementsTotalReactions,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.engagementsTotalReactions]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 66, trend: '+10%'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 462, trend: '+8%'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 1980, trend: '+5%'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 23760, trend: '+2%'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.engagementsTotalComments,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.engagementsTotalComments]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 66, trend: '-5%'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 462, trend: '-2%'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 1980, trend: '+1%'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 23760, trend: '+0.5%'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.engagementsReportsPending,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.engagementsReportsPending]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 2, trend: '+1'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 2, trend: '-3'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 2, trend: '-10'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 2, trend: '-50'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.engagementsAverageEngagementRate,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.engagementsAverageEngagementRate]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 5, trend: '+0.5%'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 5, trend: '-0.2%'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 5, trend: '+0.1%'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 5, trend: '0%'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.engagementsReportsResolved,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.engagementsReportsResolved]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 1, trend: '+1'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 8, trend: '+3'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 30, trend: '+5'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 350, trend: '+350'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.engagementsReportsAverageResolutionTime,
      label: {
        for (final lang in _kpiLabels.keys)
          lang:
              _kpiLabels[lang]![KpiCardId
                  .engagementsReportsAverageResolutionTime]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 12, trend: '-2h'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 18, trend: '+1h'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 24, trend: '+4h'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 36, trend: '+8h'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.engagementsAppReviewsTotalFeedback,
      label: {
        for (final lang in _kpiLabels.keys)
          lang:
              _kpiLabels[lang]![KpiCardId.engagementsAppReviewsTotalFeedback]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 5, trend: '+1'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 25, trend: '+5'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 100, trend: '+20'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 1200, trend: '+1200'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.engagementsAppReviewsPositiveFeedback,
      label: {
        for (final lang in _kpiLabels.keys)
          lang:
              _kpiLabels[lang]![KpiCardId
                  .engagementsAppReviewsPositiveFeedback]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 4, trend: '+1'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 20, trend: '+3'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 80, trend: '+15'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 960, trend: '+960'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.engagementsAppReviewsStoreRequests,
      label: {
        for (final lang in _kpiLabels.keys)
          lang:
              _kpiLabels[lang]![KpiCardId.engagementsAppReviewsStoreRequests]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 1, trend: '0'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 5, trend: '+1'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 20, trend: '+4'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 240, trend: '+240'),
      },
    ),

    // --- Rewards Management ---
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.rewardsAdsWatchedTotal,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.rewardsAdsWatchedTotal]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 150, trend: '+12'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 1050, trend: '+50'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 4500, trend: '+150'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 54000, trend: '+5000'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.rewardsGrantedTotal,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.rewardsGrantedTotal]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 145, trend: '+10'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 1000, trend: '+45'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 4300, trend: '+140'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 52000, trend: '+4800'),
      },
    ),
    KpiCardData(
      id: uuid.v4(),
      cardId: KpiCardId.rewardsActiveUsersCount,
      label: {
        for (final lang in _kpiLabels.keys)
          lang: _kpiLabels[lang]![KpiCardId.rewardsActiveUsersCount]!,
      },
      timeFrames: const {
        KpiTimeFrame.day: KpiTimeFrameData(value: 45, trend: '+5'),
        KpiTimeFrame.week: KpiTimeFrameData(value: 300, trend: '+20'),
        KpiTimeFrame.month: KpiTimeFrameData(value: 1200, trend: '+100'),
        KpiTimeFrame.year: KpiTimeFrameData(value: 1200, trend: '+1200'),
      },
    ),
  ];
}

/// A map containing the display labels for each KPI card in all supported languages.
final Map<SupportedLanguage, Map<KpiCardId, String>> _kpiLabels = {
  SupportedLanguage.en: {
    KpiCardId.usersTotalRegistered: 'Total Users',
    KpiCardId.usersNewRegistrations: 'New Registrations',
    KpiCardId.usersActiveUsers: 'Active Users',
    KpiCardId.contentHeadlinesTotalPublished: 'Total Headlines',
    KpiCardId.contentHeadlinesTotalViews: 'Total Views',
    KpiCardId.contentHeadlinesTotalLikes: 'Total Likes',
    KpiCardId.contentSourcesTotalSources: 'Total Sources',
    KpiCardId.contentSourcesNewSources: 'New Sources',
    KpiCardId.contentSourcesTotalFollowers: 'Total Followers',
    KpiCardId.contentTopicsTotalTopics: 'Total Topics',
    KpiCardId.contentTopicsNewTopics: 'New Topics',
    KpiCardId.contentTopicsTotalFollowers: 'Total Followers',
    KpiCardId.engagementsTotalReactions: 'Total Reactions',
    KpiCardId.engagementsTotalComments: 'Total Comments',
    KpiCardId.engagementsAverageEngagementRate: 'Avg. Engagement Rate',
    KpiCardId.engagementsReportsPending: 'Pending Reports',
    KpiCardId.engagementsReportsResolved: 'Resolved Reports',
    KpiCardId.engagementsReportsAverageResolutionTime: 'Avg. Resolution Time',
    KpiCardId.engagementsAppReviewsTotalFeedback: 'Total Feedback',
    KpiCardId.engagementsAppReviewsPositiveFeedback: 'Positive Feedback',
    KpiCardId.engagementsAppReviewsStoreRequests: 'Store Requests',
    KpiCardId.rewardsAdsWatchedTotal: 'Ads Watched',
    KpiCardId.rewardsGrantedTotal: 'Rewards Granted',
    KpiCardId.rewardsActiveUsersCount: 'Active Reward Users',
  },
  SupportedLanguage.ar: {
    KpiCardId.usersTotalRegistered: 'إجمالي المستخدمين',
    KpiCardId.usersNewRegistrations: 'التسجيلات الجديدة',
    KpiCardId.usersActiveUsers: 'المستخدمون النشطون',
    KpiCardId.contentHeadlinesTotalPublished: 'إجمالي العناوين',
    KpiCardId.contentHeadlinesTotalViews: 'إجمالي المشاهدات',
    KpiCardId.contentHeadlinesTotalLikes: 'إجمالي الإعجابات',
    KpiCardId.contentSourcesTotalSources: 'إجمالي المصادر',
    KpiCardId.contentSourcesNewSources: 'مصادر جديدة',
    KpiCardId.contentSourcesTotalFollowers: 'إجمالي المتابعين',
    KpiCardId.contentTopicsTotalTopics: 'إجمالي المواضيع',
    KpiCardId.contentTopicsNewTopics: 'مواضيع جديدة',
    KpiCardId.contentTopicsTotalFollowers: 'إجمالي المتابعين',
    KpiCardId.engagementsTotalReactions: 'إجمالي التفاعلات',
    KpiCardId.engagementsTotalComments: 'إجمالي التعليقات',
    KpiCardId.engagementsAverageEngagementRate: 'متوسط معدل التفاعل',
    KpiCardId.engagementsReportsPending: 'تقارير معلقة',
    KpiCardId.engagementsReportsResolved: 'تقارير محلولة',
    KpiCardId.engagementsReportsAverageResolutionTime: 'متوسط وقت الحل',
    KpiCardId.engagementsAppReviewsTotalFeedback: 'إجمالي التقييمات',
    KpiCardId.engagementsAppReviewsPositiveFeedback: 'تقييمات إيجابية',
    KpiCardId.engagementsAppReviewsStoreRequests: 'طلبات تقييم المتجر',
    KpiCardId.rewardsAdsWatchedTotal: 'الإعلانات المشاهدة',
    KpiCardId.rewardsGrantedTotal: 'المكافآت الممنوحة',
    KpiCardId.rewardsActiveUsersCount: 'مستخدمو المكافآت النشطون',
  },
  SupportedLanguage.es: {
    KpiCardId.usersTotalRegistered: 'Usuarios totales',
    KpiCardId.usersNewRegistrations: 'Nuevos registros',
    KpiCardId.usersActiveUsers: 'Usuarios activos',
    KpiCardId.contentHeadlinesTotalPublished: 'Titulares totales',
    KpiCardId.contentHeadlinesTotalViews: 'Vistas totales',
    KpiCardId.contentHeadlinesTotalLikes: 'Me gusta totales',
    KpiCardId.contentSourcesTotalSources: 'Fuentes totales',
    KpiCardId.contentSourcesNewSources: 'Nuevas fuentes',
    KpiCardId.contentSourcesTotalFollowers: 'Seguidores totales',
    KpiCardId.contentTopicsTotalTopics: 'Temas totales',
    KpiCardId.contentTopicsNewTopics: 'Nuevos temas',
    KpiCardId.contentTopicsTotalFollowers: 'Seguidores totales',
    KpiCardId.engagementsTotalReactions: 'Reacciones totales',
    KpiCardId.engagementsTotalComments: 'Comentarios totales',
    KpiCardId.engagementsAverageEngagementRate: 'Tasa de participación media',
    KpiCardId.engagementsReportsPending: 'Informes pendientes',
    KpiCardId.engagementsReportsResolved: 'Informes resueltos',
    KpiCardId.engagementsReportsAverageResolutionTime:
        'Tiempo medio de resolución',
    KpiCardId.engagementsAppReviewsTotalFeedback: 'Comentarios totales',
    KpiCardId.engagementsAppReviewsPositiveFeedback: 'Comentarios positivos',
    KpiCardId.engagementsAppReviewsStoreRequests: 'Solicitudes de tienda',
    KpiCardId.rewardsAdsWatchedTotal: 'Anuncios vistos',
    KpiCardId.rewardsGrantedTotal: 'Recompensas otorgadas',
    KpiCardId.rewardsActiveUsersCount: 'Usuarios de recompensas activos',
  },
  SupportedLanguage.fr: {
    KpiCardId.usersTotalRegistered: 'Utilisateurs totaux',
    KpiCardId.usersNewRegistrations: 'Nouvelles inscriptions',
    KpiCardId.usersActiveUsers: 'Utilisateurs actifs',
    KpiCardId.contentHeadlinesTotalPublished: 'Total des titres',
    KpiCardId.contentHeadlinesTotalViews: 'Vues totales',
    KpiCardId.contentHeadlinesTotalLikes: "J'aime totaux",
    KpiCardId.contentSourcesTotalSources: 'Sources totales',
    KpiCardId.contentSourcesNewSources: 'Nouvelles sources',
    KpiCardId.contentSourcesTotalFollowers: 'Abonnés totaux',
    KpiCardId.contentTopicsTotalTopics: 'Sujets totaux',
    KpiCardId.contentTopicsNewTopics: 'Nouveaux sujets',
    KpiCardId.contentTopicsTotalFollowers: 'Abonnés totaux',
    KpiCardId.engagementsTotalReactions: 'Réactions totales',
    KpiCardId.engagementsTotalComments: 'Commentaires totaux',
    KpiCardId.engagementsAverageEngagementRate: "Taux d'engagement moyen",
    KpiCardId.engagementsReportsPending: 'Rapports en attente',
    KpiCardId.engagementsReportsResolved: 'Rapports résolus',
    KpiCardId.engagementsReportsAverageResolutionTime:
        'Temps de résolution moyen',
    KpiCardId.engagementsAppReviewsTotalFeedback: 'Commentaires totaux',
    KpiCardId.engagementsAppReviewsPositiveFeedback: 'Commentaires positifs',
    KpiCardId.engagementsAppReviewsStoreRequests: 'Demandes de magasin',
    KpiCardId.rewardsAdsWatchedTotal: 'Publicités regardées',
    KpiCardId.rewardsGrantedTotal: 'Récompenses accordées',
    KpiCardId.rewardsActiveUsersCount: 'Utilisateurs de récompenses actifs',
  },
  SupportedLanguage.pt: {
    KpiCardId.usersTotalRegistered: 'Total de usuários',
    KpiCardId.usersNewRegistrations: 'Novos registros',
    KpiCardId.usersActiveUsers: 'Usuários ativos',
    KpiCardId.contentHeadlinesTotalPublished: 'Total de manchetes',
    KpiCardId.contentHeadlinesTotalViews: 'Total de visualizações',
    KpiCardId.contentHeadlinesTotalLikes: 'Total de curtidas',
    KpiCardId.contentSourcesTotalSources: 'Total de fontes',
    KpiCardId.contentSourcesNewSources: 'Novas fontes',
    KpiCardId.contentSourcesTotalFollowers: 'Total de seguidores',
    KpiCardId.contentTopicsTotalTopics: 'Total de tópicos',
    KpiCardId.contentTopicsNewTopics: 'Novos tópicos',
    KpiCardId.contentTopicsTotalFollowers: 'Total de seguidores',
    KpiCardId.engagementsTotalReactions: 'Total de reações',
    KpiCardId.engagementsTotalComments: 'Total de comentários',
    KpiCardId.engagementsAverageEngagementRate: 'Taxa média de engajamento',
    KpiCardId.engagementsReportsPending: 'Denúncias pendentes',
    KpiCardId.engagementsReportsResolved: 'Denúncias resolvidas',
    KpiCardId.engagementsReportsAverageResolutionTime:
        'Tempo médio de resolução',
    KpiCardId.engagementsAppReviewsTotalFeedback: 'Feedback total',
    KpiCardId.engagementsAppReviewsPositiveFeedback: 'Feedback positivo',
    KpiCardId.engagementsAppReviewsStoreRequests: 'Solicitações da loja',
    KpiCardId.rewardsAdsWatchedTotal: 'Anúncios assistidos',
    KpiCardId.rewardsGrantedTotal: 'Recompensas concedidas',
    KpiCardId.rewardsActiveUsersCount: 'Usuários de recompensas ativos',
  },
  SupportedLanguage.de: {
    KpiCardId.usersTotalRegistered: 'Benutzer gesamt',
    KpiCardId.usersNewRegistrations: 'Neuregistrierungen',
    KpiCardId.usersActiveUsers: 'Aktive Benutzer',
    KpiCardId.contentHeadlinesTotalPublished: 'Schlagzeilen gesamt',
    KpiCardId.contentHeadlinesTotalViews: 'Gesamtansichten',
    KpiCardId.contentHeadlinesTotalLikes: 'Likes gesamt',
    KpiCardId.contentSourcesTotalSources: 'Quellen gesamt',
    KpiCardId.contentSourcesNewSources: 'Neue Quellen',
    KpiCardId.contentSourcesTotalFollowers: 'Follower gesamt',
    KpiCardId.contentTopicsTotalTopics: 'Themen gesamt',
    KpiCardId.contentTopicsNewTopics: 'Neue Themen',
    KpiCardId.contentTopicsTotalFollowers: 'Follower gesamt',
    KpiCardId.engagementsTotalReactions: 'Reaktionen gesamt',
    KpiCardId.engagementsTotalComments: 'Kommentare gesamt',
    KpiCardId.engagementsAverageEngagementRate: 'Durchschn. Engagement-Rate',
    KpiCardId.engagementsReportsPending: 'Ausstehende Berichte',
    KpiCardId.engagementsReportsResolved: 'Gelöste Berichte',
    KpiCardId.engagementsReportsAverageResolutionTime: 'Durchschn. Lösungszeit',
    KpiCardId.engagementsAppReviewsTotalFeedback: 'Feedback gesamt',
    KpiCardId.engagementsAppReviewsPositiveFeedback: 'Positives Feedback',
    KpiCardId.engagementsAppReviewsStoreRequests: 'Store-Anfragen',
    KpiCardId.rewardsAdsWatchedTotal: 'Angesehene Anzeigen',
    KpiCardId.rewardsGrantedTotal: 'Gewährte Belohnungen',
    KpiCardId.rewardsActiveUsersCount: 'Aktive Belohnungsbenutzer',
  },
  SupportedLanguage.it: {
    KpiCardId.usersTotalRegistered: 'Utenti totali',
    KpiCardId.usersNewRegistrations: 'Nuove registrazioni',
    KpiCardId.usersActiveUsers: 'Utenti attivi',
    KpiCardId.contentHeadlinesTotalPublished: 'Titoli totali',
    KpiCardId.contentHeadlinesTotalViews: 'Visualizzazioni totali',
    KpiCardId.contentHeadlinesTotalLikes: 'Mi piace totali',
    KpiCardId.contentSourcesTotalSources: 'Fonti totali',
    KpiCardId.contentSourcesNewSources: 'Nuove fonti',
    KpiCardId.contentSourcesTotalFollowers: 'Follower totali',
    KpiCardId.contentTopicsTotalTopics: 'Argomenti totali',
    KpiCardId.contentTopicsNewTopics: 'Nuovi argomenti',
    KpiCardId.contentTopicsTotalFollowers: 'Follower totali',
    KpiCardId.engagementsTotalReactions: 'Reazioni totali',
    KpiCardId.engagementsTotalComments: 'Commenti totali',
    KpiCardId.engagementsAverageEngagementRate: 'Tasso di coinvolgimento medio',
    KpiCardId.engagementsReportsPending: 'Segnalazioni in sospeso',
    KpiCardId.engagementsReportsResolved: 'Segnalazioni risolte',
    KpiCardId.engagementsReportsAverageResolutionTime:
        'Tempo medio di risoluzione',
    KpiCardId.engagementsAppReviewsTotalFeedback: 'Feedback totale',
    KpiCardId.engagementsAppReviewsPositiveFeedback: 'Feedback positivo',
    KpiCardId.engagementsAppReviewsStoreRequests: 'Richieste dello store',
    KpiCardId.rewardsAdsWatchedTotal: 'Annunci guardati',
    KpiCardId.rewardsGrantedTotal: 'Ricompense concesse',
    KpiCardId.rewardsActiveUsersCount: 'Utenti premio attivi',
  },
  SupportedLanguage.zh: {
    KpiCardId.usersTotalRegistered: '用户总数',
    KpiCardId.usersNewRegistrations: '新注册',
    KpiCardId.usersActiveUsers: '活跃用户',
    KpiCardId.contentHeadlinesTotalPublished: '头条总数',
    KpiCardId.contentHeadlinesTotalViews: '总浏览量',
    KpiCardId.contentHeadlinesTotalLikes: '总点赞数',
    KpiCardId.contentSourcesTotalSources: '来源总数',
    KpiCardId.contentSourcesNewSources: '新来源',
    KpiCardId.contentSourcesTotalFollowers: '总关注者',
    KpiCardId.contentTopicsTotalTopics: '主题总数',
    KpiCardId.contentTopicsNewTopics: '新主题',
    KpiCardId.contentTopicsTotalFollowers: '总关注者',
    KpiCardId.engagementsTotalReactions: '总反应',
    KpiCardId.engagementsTotalComments: '总评论',
    KpiCardId.engagementsAverageEngagementRate: '平均参与率',
    KpiCardId.engagementsReportsPending: '待处理报告',
    KpiCardId.engagementsReportsResolved: '已解决报告',
    KpiCardId.engagementsReportsAverageResolutionTime: '平均解决时间',
    KpiCardId.engagementsAppReviewsTotalFeedback: '总反馈',
    KpiCardId.engagementsAppReviewsPositiveFeedback: '正面反馈',
    KpiCardId.engagementsAppReviewsStoreRequests: '商店请求',
    KpiCardId.rewardsAdsWatchedTotal: '已观看广告',
    KpiCardId.rewardsGrantedTotal: '已发放奖励',
    KpiCardId.rewardsActiveUsersCount: '活跃奖励用户',
  },
  SupportedLanguage.hi: {
    KpiCardId.usersTotalRegistered: 'कुल उपयोगकर्ता',
    KpiCardId.usersNewRegistrations: 'नए पंजीकरण',
    KpiCardId.usersActiveUsers: 'सक्रिय उपयोगकर्ता',
    KpiCardId.contentHeadlinesTotalPublished: 'कुल सुर्खियाँ',
    KpiCardId.contentHeadlinesTotalViews: 'कुल दृश्य',
    KpiCardId.contentHeadlinesTotalLikes: 'कुल पसंद',
    KpiCardId.contentSourcesTotalSources: 'कुल स्रोत',
    KpiCardId.contentSourcesNewSources: 'नए स्रोत',
    KpiCardId.contentSourcesTotalFollowers: 'कुल अनुयायी',
    KpiCardId.contentTopicsTotalTopics: 'कुल विषय',
    KpiCardId.contentTopicsNewTopics: 'नए विषय',
    KpiCardId.contentTopicsTotalFollowers: 'कुल अनुयायी',
    KpiCardId.engagementsTotalReactions: 'कुल प्रतिक्रियाएँ',
    KpiCardId.engagementsTotalComments: 'कुल टिप्पणियाँ',
    KpiCardId.engagementsAverageEngagementRate: 'औसत जुड़ाव दर',
    KpiCardId.engagementsReportsPending: 'लंबित रिपोर्ट',
    KpiCardId.engagementsReportsResolved: 'हल की गई रिपोर्ट',
    KpiCardId.engagementsReportsAverageResolutionTime: 'औसत समाधान समय',
    KpiCardId.engagementsAppReviewsTotalFeedback: 'कुल प्रतिक्रिया',
    KpiCardId.engagementsAppReviewsPositiveFeedback: 'सकारात्मक प्रतिक्रिया',
    KpiCardId.engagementsAppReviewsStoreRequests: 'स्टोर अनुरोध',
    KpiCardId.rewardsAdsWatchedTotal: 'देखे गए विज्ञापन',
    KpiCardId.rewardsGrantedTotal: 'दिए गए पुरस्कार',
    KpiCardId.rewardsActiveUsersCount: 'सक्रिय पुरस्कार उपयोगकर्ता',
  },
  SupportedLanguage.ja: {
    KpiCardId.usersTotalRegistered: '総ユーザー数',
    KpiCardId.usersNewRegistrations: '新規登録',
    KpiCardId.usersActiveUsers: 'アクティブユーザー',
    KpiCardId.contentHeadlinesTotalPublished: '総見出し数',
    KpiCardId.contentHeadlinesTotalViews: '総閲覧数',
    KpiCardId.contentHeadlinesTotalLikes: '総いいね数',
    KpiCardId.contentSourcesTotalSources: '総ソース数',
    KpiCardId.contentSourcesNewSources: '新しいソース',
    KpiCardId.contentSourcesTotalFollowers: '総フォロワー数',
    KpiCardId.contentTopicsTotalTopics: '総トピック数',
    KpiCardId.contentTopicsNewTopics: '新しいトピック',
    KpiCardId.contentTopicsTotalFollowers: '総フォロワー数',
    KpiCardId.engagementsTotalReactions: '総リアクション数',
    KpiCardId.engagementsTotalComments: '総コメント数',
    KpiCardId.engagementsAverageEngagementRate: '平均エンゲージメント率',
    KpiCardId.engagementsReportsPending: '保留中のレポート',
    KpiCardId.engagementsReportsResolved: '解決されたレポート',
    KpiCardId.engagementsReportsAverageResolutionTime: '平均解決時間',
    KpiCardId.engagementsAppReviewsTotalFeedback: '総フィードバック',
    KpiCardId.engagementsAppReviewsPositiveFeedback: 'ポジティブなフィードバック',
    KpiCardId.engagementsAppReviewsStoreRequests: 'ストアリクエスト',
    KpiCardId.rewardsAdsWatchedTotal: '視聴された広告',
    KpiCardId.rewardsGrantedTotal: '付与された報酬',
    KpiCardId.rewardsActiveUsersCount: 'アクティブな報酬ユーザー',
  },
};
