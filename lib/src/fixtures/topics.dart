import 'package:core/src/enums/enums.dart';
import 'package:core/src/fixtures/fixture_ids.dart';
import 'package:core/src/models/entities/topic.dart';

/// Generates a list of predefined topics for fixture data.
///
/// This function can be configured to generate topics in either English or
/// Arabic.
List<Topic> getTopicsFixturesData({String languageCode = 'en'}) {
  // Ensure only approved languages are used, default to 'en'.
  final resolvedLanguageCode = ['en', 'ar'].contains(languageCode)
      ? languageCode
      : 'en';

  final topics = <Topic>[];
  for (var i = 0; i < _topicIds.length; i++) {
    topics.add(
      Topic(
        id: _topicIds[i],
        name: {
          for (final lang in _namesByLang.keys)
            ContentLanguage.values.byName(lang): _namesByLang[lang]![i],
        },
        description: {
          for (final lang in _descriptionsByLang.keys)
            ContentLanguage.values.byName(lang): _descriptionsByLang[lang]![i],
        },
        iconUrl: 'https://example.com/icons/${_iconNames[i]}.png',
        createdAt: DateTime.parse(
          '2023-01-01T10:00:00.000Z',
        ).add(Duration(days: i)),
        updatedAt: DateTime.parse(
          '2023-01-01T10:00:00.000Z',
        ).add(Duration(days: i)),
        status: ContentStatus.active,
      ),
    );
  }
  return topics;
}

const _topicIds = [
  kTopicId1,
  kTopicId2,
  kTopicId3,
  kTopicId4,
  kTopicId5,
  kTopicId6,
  kTopicId7,
  kTopicId8,
  kTopicId9,
  kTopicId10,
];

const _iconNames = [
  'tech',
  'sports',
  'politics',
  'science',
  'health',
  'entertainment',
  'business',
  'travel',
  'food',
  'education',
];

final Map<String, List<String>> _namesByLang = {
  'en': [
    'Technology',
    'Sports',
    'Politics',
    'Science',
    'Health',
    'Entertainment',
    'Business',
    'Travel',
    'Food',
    'Education',
  ],
  'ar': [
    'التكنولوجيا',
    'الرياضة',
    'السياسة',
    'العلوم',
    'الصحة',
    'الترفيه',
    'الأعمال',
    'السفر',
    'الطعام',
    'التعليم',
  ],
};

final Map<String, List<String>> _descriptionsByLang = {
  'en': [
    'News and updates from the world of technology.',
    'Latest scores, highlights, and news from sports.',
    'Updates on political events and government policies.',
    'Discoveries and breakthroughs in scientific research.',
    'Information and advice on health and wellness.',
    'News from movies, music, and pop culture.',
    'Financial markets, economy, and corporate news.',
    'Guides, tips, and news for travelers.',
    'Recipes, culinary trends, and food industry news.',
    'Developments in education and learning.',
  ],
  'ar': [
    'أخبار وتحديثات من عالم التكنولوجيا.',
    'آخر النتائج والأهداف والأخبار من عالم الرياضة.',
    'تحديثات حول الأحداث السياسية والسياسات الحكومية.',
    'اكتشافات وإنجازات في البحث العلمي.',
    'معلومات ونصائح حول الصحة والعافية.',
    'أخبار من الأفلام والموسيقى وثقافة البوب.',
    'الأسواق المالية والاقتصاد وأخبار الشركات.',
    'أدلة ونصائح وأخبار للمسافرين.',
    'وصفات واتجاهات الطهي وأخبار صناعة المواد الغذائية.',
    'التطورات في التعليم والتعلم.',
  ],
};
