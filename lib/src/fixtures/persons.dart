import 'package:core/core.dart';

/// Generates a list of predefined persons for fixture data.
List<Person> getPersonsFixturesData() {
  return [
    Person(
      id: kPersonId1,
      name: const {SupportedLanguage.en: 'John Doe'},
      description: const {
        SupportedLanguage.en: 'A prominent figure in technology.',
      },
      createdAt: DateTime(2024, 1, 1),
      updatedAt: DateTime(2024, 1, 1),
      status: ContentStatus.active,
      imageUrl: 'https://picsum.photos/seed/person1/400/400',
    ),
    Person(
      id: kPersonId2,
      name: const {SupportedLanguage.en: 'Jane Smith'},
      description: const {SupportedLanguage.en: 'An influential policy maker.'},
      createdAt: DateTime(2024, 1, 1),
      updatedAt: DateTime(2024, 1, 1),
      status: ContentStatus.active,
      imageUrl: 'https://picsum.photos/seed/person2/400/400',
    ),
  ];
}
