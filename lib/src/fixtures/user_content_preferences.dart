import 'package:core/core.dart';

/// Generates a list of predefined user content preferences for fixture data.
///
/// This function generates preferences using multilingual fixture data.
List<UserContentPreferences> getUserContentPreferencesFixturesData() {
  // Get language-specific fixtures
  final sources = getSourcesFixturesData();
  final topics = getTopicsFixturesData();
  final headlines = getHeadlinesFixturesData();
  final savedHeadlineFilters = getSavedHeadlineFiltersFixturesData();

  return [
    UserContentPreferences(
      id: kAdminUserId,
      followedCountries: const [],
      followedSources: [
        sources[0], // TechCrunch
        sources[1], // BBC News
        sources[10], // San Francisco Chronicle
        sources[40], // ESPN
      ],
      followedTopics: [
        topics[0], // Technology
        topics[1], // Sports
        topics[6], // Business
        topics[7], // Travel
      ],
      savedHeadlines: [headlines[0], headlines[10]],
      savedHeadlineFilters: savedHeadlineFilters
          .map((e) => e.copyWith(userId: kAdminUserId))
          .toList(),
    ),
    UserContentPreferences(
      id: kPublisherStandardId, // Publisher (Standard)
      followedCountries: const [],
      followedSources: [
        sources[3], // The Guardian
        sources[4], // CNN
      ],
      followedTopics: [
        topics[2], // Politics
        topics[4], // Health
      ],
      savedHeadlines: [headlines[4], headlines[5]],
      savedHeadlineFilters: savedHeadlineFilters
          .map((e) => e.copyWith(userId: kPublisherStandardId))
          .toList(),
    ),
    // Add preferences for users 3-10
    ...List.generate(8, (index) {
      final userId = [
        kUser3Id,
        kUser4Id,
        kUser5Id,
        kUser6Id,
        kUser7Id,
        kUser8Id,
        kUser9Id,
        kUser10Id,
      ][index];
      return UserContentPreferences(
        id: userId,
        followedCountries: const [],
        followedSources: [sources[index % 10], sources[(index + 1) % 10]],
        followedTopics: [topics[index % 5], topics[(index + 1) % 5]],
        savedHeadlines: [headlines[index * 2], headlines[index * 2 + 1]],
        savedHeadlineFilters: savedHeadlineFilters
            .map((e) => e.copyWith(userId: userId))
            .toList(),
      );
    }),
  ];
}
