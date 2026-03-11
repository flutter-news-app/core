import 'package:core/core.dart';

/// Generates a list of predefined persons for fixture data.
List<Person> getPersonsFixturesData() {
  return [
    const Person(
      id: kPersonId1,
      name: {SupportedLanguage.en: 'John Doe'},
      description: {SupportedLanguage.en: 'A prominent figure in technology.'},
      imageUrl: 'https://picsum.photos/seed/person1/400/400',
    ),
    const Person(
      id: kPersonId2,
      name: {SupportedLanguage.en: 'Jane Smith'},
      description: {SupportedLanguage.en: 'An influential policy maker.'},
      imageUrl: 'https://picsum.photos/seed/person2/400/400',
    ),
  ];
}
