import 'package:core/core.dart';

/// Generates a list of predefined saved headline filters for fixture data.
List<SavedHeadlineFilter> getSavedHeadlineFiltersFixturesData() {
  final topics = getTopicsFixturesData();

  final names = <SupportedLanguage, List<String>>{
    SupportedLanguage.en: ['US Tech News', 'Global Business'],
    SupportedLanguage.ar: ['أخبار التكنولوجيا الأمريكية', 'أعمال عالمية'],
    SupportedLanguage.es: [
      'Noticias tecnológicas de EE. UU.',
      'Negocios globales',
    ],
    SupportedLanguage.fr: [
      'Actualités technologiques américaines',
      'Affaires mondiales',
    ],
    SupportedLanguage.pt: [
      'Notícias de tecnologia dos EUA',
      'Negócios globais',
    ],
    SupportedLanguage.de: ['US-Tech-Nachrichten', 'Globales Geschäft'],
    SupportedLanguage.it: ['Notizie tecnologiche dagli USA', 'Affari globali'],
    SupportedLanguage.zh: ['美国科技新闻', '全球商业'],
    SupportedLanguage.hi: ['अमेरिकी तकनीकी समाचार', 'वैश्विक व्यापार'],
    SupportedLanguage.ja: ['米国の技術ニュース', 'グローバルビジネス'],
  };

  return <SavedHeadlineFilter>[
    SavedHeadlineFilter(
      id: kSavedHeadlineFilterId1,
      userId: kAdminUserId,
      name: {for (final lang in names.keys) lang: names[lang]![0]},
      isPinned: true,
      deliveryTypes: const {
        PushNotificationSubscriptionDeliveryType.breakingOnly,
      },
      criteria: HeadlineFilterCriteria(
        topics: [topics[0]], // Technology
        sources: const [],
        countries: [countriesFixturesData[0]], // United States
      ),
    ),
    SavedHeadlineFilter(
      id: kSavedHeadlineFilterId2,
      userId: kAdminUserId,
      name: {for (final lang in names.keys) lang: names[lang]![1]},
      isPinned: false,
      deliveryTypes: const {
        PushNotificationSubscriptionDeliveryType.breakingOnly,
      },
      criteria: HeadlineFilterCriteria(
        topics: [topics[6]], // Business
        sources: const [],
        countries: const [],
      ),
    ),
  ];
}
