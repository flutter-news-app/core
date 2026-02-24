import 'dart:math';

import 'package:core/core.dart';
import 'package:uuid/uuid.dart';

/// Generates a list of predefined ranked list card data fixtures.
///
/// ### Data Realism
/// The data in this fixture is designed to be **highly realistic and consistent**
/// with other fixtures. It achieves this by:
/// 1. Fetching the actual lists of headlines, sources, and topics from their
///    respective fixture files (`headlines.dart`, `sources.dart`, etc.).
/// 2. Using helper functions (`_getRankedHeadlines`, etc.) to shuffle these
///    real entities and assign them plausible metric values.
/// This ensures that the "Most Viewed Headlines" card displays real headline
/// titles that exist elsewhere in the demo data.
List<RankedListCardData> getRankedListCardsFixturesData() {
  const uuid = Uuid();

  final allHeadlines = getHeadlinesFixturesData();
  final allSources = getSourcesFixturesData();
  final allTopics = getTopicsFixturesData();

  return [
    // --- Overview Page ---
    RankedListCardData(
      id: uuid.v4(),
      cardId: RankedListCardId.overviewHeadlinesMostViewed,
      label: {
        for (final lang in _rankedListLabels.keys)
          lang:
              _rankedListLabels[lang]![RankedListCardId
                  .overviewHeadlinesMostViewed]!,
      },
      timeFrames: {
        RankedListTimeFrame.day: _getRankedHeadlines(allHeadlines, 5, 1000),
        RankedListTimeFrame.week: _getRankedHeadlines(allHeadlines, 5, 7000),
        RankedListTimeFrame.month: _getRankedHeadlines(allHeadlines, 5, 30000),
        RankedListTimeFrame.year: _getRankedHeadlines(allHeadlines, 5, 365000),
      },
    ),
    RankedListCardData(
      id: uuid.v4(),
      cardId: RankedListCardId.overviewHeadlinesMostLiked,
      label: {
        for (final lang in _rankedListLabels.keys)
          lang:
              _rankedListLabels[lang]![RankedListCardId
                  .overviewHeadlinesMostLiked]!,
      },
      timeFrames: {
        RankedListTimeFrame.day: _getRankedHeadlines(allHeadlines, 5, 200),
        RankedListTimeFrame.week: _getRankedHeadlines(allHeadlines, 5, 1400),
        RankedListTimeFrame.month: _getRankedHeadlines(allHeadlines, 5, 6000),
        RankedListTimeFrame.year: _getRankedHeadlines(allHeadlines, 5, 72000),
      },
    ),
    RankedListCardData(
      id: uuid.v4(),
      cardId: RankedListCardId.overviewSourcesMostFollowed,
      label: {
        for (final lang in _rankedListLabels.keys)
          lang:
              _rankedListLabels[lang]![RankedListCardId
                  .overviewSourcesMostFollowed]!,
      },
      timeFrames: {
        RankedListTimeFrame.day: _getRankedSources(allSources, 5, 50),
        RankedListTimeFrame.week: _getRankedSources(allSources, 5, 350),
        RankedListTimeFrame.month: _getRankedSources(allSources, 5, 1500),
        RankedListTimeFrame.year: _getRankedSources(allSources, 5, 18000),
      },
    ),
    RankedListCardData(
      id: uuid.v4(),
      cardId: RankedListCardId.overviewTopicsMostFollowed,
      label: {
        for (final lang in _rankedListLabels.keys)
          lang:
              _rankedListLabels[lang]![RankedListCardId
                  .overviewTopicsMostFollowed]!,
      },
      timeFrames: {
        RankedListTimeFrame.day: _getRankedTopics(allTopics, 5, 80),
        RankedListTimeFrame.week: _getRankedTopics(allTopics, 5, 560),
        RankedListTimeFrame.month: _getRankedTopics(allTopics, 5, 2400),
        RankedListTimeFrame.year: _getRankedTopics(allTopics, 5, 29000),
      },
    ),
  ];
}

/// Creates a sorted list of [RankedListItem]s from a given list of [Headline]s.
///
/// This helper function simulates a "Top N" list by:
/// 1. Shuffling the input `items` to ensure a different ranking on each call.
/// 2. Taking the first `count` items from the shuffled list.
/// 3. Mapping each `Headline` to a `RankedListItem`, assigning it a random
///    `metricValue` to simulate view counts, likes, etc.
/// 4. Sorting the final list in descending order by `metricValue`.
List<RankedListItem> _getRankedHeadlines(
  List<Headline> items,
  int count,
  int max,
) {
  final random = Random();
  items.shuffle(random);
  return items
      .take(count)
      .map(
        (item) => RankedListItem(
          entityId: item.id,
          displayTitle: item.title,
          metricValue: random.nextInt(max) + max * 0.5,
        ),
      )
      .toList()
    ..sort((a, b) => b.metricValue.compareTo(a.metricValue));
}

/// Creates a sorted list of [RankedListItem]s from a given list of [Source]s.
///
/// This helper function simulates a "Top N" list by:
/// 1. Shuffling the input `items` to ensure a different ranking on each call.
/// 2. Taking the first `count` items from the shuffled list.
/// 3. Mapping each `Source` to a `RankedListItem`, assigning it a random
///    `metricValue` to simulate follower counts, etc.
/// 4. Sorting the final list in descending order by `metricValue`.
List<RankedListItem> _getRankedSources(List<Source> items, int count, int max) {
  final random = Random();
  items.shuffle(random);
  return items
      .take(count)
      .map(
        (item) => RankedListItem(
          entityId: item.id,
          displayTitle: item.name,
          metricValue: random.nextInt(max) + max * 0.5,
        ),
      )
      .toList()
    ..sort((a, b) => b.metricValue.compareTo(a.metricValue));
}

/// Creates a sorted list of [RankedListItem]s from a given list of [Topic]s.
///
/// This helper function simulates a "Top N" list by:
/// 1. Shuffling the input `items` to ensure a different ranking on each call.
/// 2. Taking the first `count` items from the shuffled list.
/// 3. Mapping each `Topic` to a `RankedListItem`, assigning it a random
///    `metricValue` to simulate follower counts, etc.
/// 4. Sorting the final list in descending order by `metricValue`.
List<RankedListItem> _getRankedTopics(List<Topic> items, int count, int max) {
  final random = Random();
  items.shuffle(random);
  return items
      .take(count)
      .map(
        (item) => RankedListItem(
          entityId: item.id,
          displayTitle: item.name,
          metricValue: random.nextInt(max) + max * 0.5,
        ),
      )
      .toList()
    ..sort((a, b) => b.metricValue.compareTo(a.metricValue));
}

/// A map containing the display labels for each ranked list card in all supported languages.
final Map<SupportedLanguage, Map<RankedListCardId, String>>
_rankedListLabels = {
  SupportedLanguage.en: {
    RankedListCardId.overviewHeadlinesMostViewed: 'Most Viewed Headlines',
    RankedListCardId.overviewHeadlinesMostLiked: 'Most Liked Headlines',
    RankedListCardId.overviewSourcesMostFollowed: 'Most Followed Sources',
    RankedListCardId.overviewTopicsMostFollowed: 'Most Followed Topics',
  },
  SupportedLanguage.ar: {
    RankedListCardId.overviewHeadlinesMostViewed: 'العناوين الأكثر مشاهدة',
    RankedListCardId.overviewHeadlinesMostLiked: 'العناوين الأكثر إعجابًا',
    RankedListCardId.overviewSourcesMostFollowed: 'المصادر الأكثر متابعة',
    RankedListCardId.overviewTopicsMostFollowed: 'المواضيع الأكثر متابعة',
  },
  SupportedLanguage.es: {
    RankedListCardId.overviewHeadlinesMostViewed: 'Titulares más vistos',
    RankedListCardId.overviewHeadlinesMostLiked: 'Titulares con más me gusta',
    RankedListCardId.overviewSourcesMostFollowed: 'Fuentes más seguidas',
    RankedListCardId.overviewTopicsMostFollowed: 'Temas más seguidos',
  },
  SupportedLanguage.fr: {
    RankedListCardId.overviewHeadlinesMostViewed: 'Titres les plus consultés',
    RankedListCardId.overviewHeadlinesMostLiked: 'Titres les plus aimés',
    RankedListCardId.overviewSourcesMostFollowed: 'Sources les plus suivies',
    RankedListCardId.overviewTopicsMostFollowed: 'Sujets les plus suivis',
  },
  SupportedLanguage.pt: {
    RankedListCardId.overviewHeadlinesMostViewed: 'Manchetes mais visualizadas',
    RankedListCardId.overviewHeadlinesMostLiked: 'Manchetes mais curtidas',
    RankedListCardId.overviewSourcesMostFollowed: 'Fontes mais seguidas',
    RankedListCardId.overviewTopicsMostFollowed: 'Tópicos mais seguidos',
  },
  SupportedLanguage.de: {
    RankedListCardId.overviewHeadlinesMostViewed: 'Meistgesehene Schlagzeilen',
    RankedListCardId.overviewHeadlinesMostLiked: 'Beliebteste Schlagzeilen',
    RankedListCardId.overviewSourcesMostFollowed: 'Meistgefolgte Quellen',
    RankedListCardId.overviewTopicsMostFollowed: 'Meistgefolgte Themen',
  },
  SupportedLanguage.it: {
    RankedListCardId.overviewHeadlinesMostViewed: 'Titoli più visti',
    RankedListCardId.overviewHeadlinesMostLiked: 'Titoli più piaciuti',
    RankedListCardId.overviewSourcesMostFollowed: 'Fonti più seguite',
    RankedListCardId.overviewTopicsMostFollowed: 'Argomenti più seguiti',
  },
  SupportedLanguage.zh: {
    RankedListCardId.overviewHeadlinesMostViewed: '浏览最多的头条新闻',
    RankedListCardId.overviewHeadlinesMostLiked: '最受欢迎的头条新闻',
    RankedListCardId.overviewSourcesMostFollowed: '关注最多的来源',
    RankedListCardId.overviewTopicsMostFollowed: '关注最多的主题',
  },
  SupportedLanguage.hi: {
    RankedListCardId.overviewHeadlinesMostViewed:
        'सबसे ज्यादा देखी गई सुर्खियाँ',
    RankedListCardId.overviewHeadlinesMostLiked:
        'सबसे ज्यादा पसंद की गई सुर्खियाँ',
    RankedListCardId.overviewSourcesMostFollowed:
        'सबसे ज्यादा फॉलो किए जाने वाले स्रोत',
    RankedListCardId.overviewTopicsMostFollowed:
        'सबसे ज्यादा फॉलो किए जाने वाले विषय',
  },
  SupportedLanguage.ja: {
    RankedListCardId.overviewHeadlinesMostViewed: '最も閲覧された見出し',
    RankedListCardId.overviewHeadlinesMostLiked: '最もいいねされた見出し',
    RankedListCardId.overviewSourcesMostFollowed: '最もフォローされているソース',
    RankedListCardId.overviewTopicsMostFollowed: '最もフォローされているトピック',
  },
};
