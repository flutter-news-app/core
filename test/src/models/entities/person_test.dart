import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('Person Model', () {
    final personFixture = getPersonsFixturesData().first;
    final personJson = personFixture.toJson();

    group('constructor', () {
      test('returns correct instance', () {
        expect(personFixture, isA<Person>());
        expect(personFixture.type, equals('person'));
      });
    });

    group('fromJson/toJson', () {
      test('round trip serialization matches fixture', () {
        final json = personFixture.toJson();
        final result = Person.fromJson(json);
        expect(result, equals(personFixture));
      });

      test('should correctly deserialize from full JSON', () {
        final person = Person.fromJson(personJson);
        expect(person, equals(personFixture));
      });
    });

    group('copyWith', () {
      test('returns a new instance with updated basic fields', () {
        final updatedPerson = personFixture.copyWith(id: 'new-id');
        expect(updatedPerson.id, equals('new-id'));
        expect(updatedPerson.name, equals(personFixture.name));
        expect(updatedPerson.description, equals(personFixture.description));
      });

      test('updates status', () {
        final updated = personFixture.copyWith(status: ContentStatus.ingested);
        expect(updated.status, equals(ContentStatus.ingested));
      });

      test('updates nullable fields using ValueWrapper', () {
        final updatedPerson = personFixture.copyWith(
          imageUrl: const ValueWrapper('https://example.com/new.png'),
          mediaAssetId: const ValueWrapper(null),
        );
        expect(updatedPerson.imageUrl, equals('https://example.com/new.png'));
        expect(updatedPerson.mediaAssetId, isNull);
      });

      test('returns identical instance if no arguments provided', () {
        expect(personFixture.copyWith(), equals(personFixture));
      });
    });

    group('Equatable', () {
      test('should equate two identical instances', () {
        final person1 = personFixture.copyWith();
        final person2 = personFixture.copyWith();
        expect(person1, equals(person2));
      });

      test('should not equate instances with different properties', () {
        final person1 = personFixture.copyWith();
        final person2 = personFixture.copyWith(
          name: {SupportedLanguage.en: 'Different Name'},
        );
        expect(person1, isNot(equals(person2)));
      });

      test('props list should contain all relevant fields', () {
        expect(personFixture.props, [
          personFixture.id,
          personFixture.name,
          personFixture.description,
          personFixture.createdAt,
          personFixture.updatedAt,
          personFixture.status,
          personFixture.imageUrl,
          personFixture.mediaAssetId,
          personFixture.type,
        ]);
      });
    });
  });
}
