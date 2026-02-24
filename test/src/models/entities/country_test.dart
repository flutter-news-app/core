import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

void main() {
  group('Country', () {
    final countryFixture = countriesFixturesData.first;
    final countryJson = countryFixture.toJson();

    test('supports value equality', () {
      final country1 = countriesFixturesData.first.copyWith();
      final country2 = countriesFixturesData.first.copyWith();
      expect(country1, equals(country2));
    });

    test('props list is correct', () {
      expect(
        countryFixture.props,
        equals([
          countryFixture.id,
          countryFixture.isoCode,
          countryFixture.name,
          countryFixture.flagUrl,
          countryFixture.type,
        ]),
      );
    });

    group('Constructor', () {
      test('works correctly', () {
        expect(() => countryFixture, returnsNormally);
      });
    });

    group('fromJson', () {
      test('works correctly when json is valid', () {
        expect(Country.fromJson(countryJson), equals(countryFixture));
      });

      test('throws CheckedFromJsonException for missing required fields', () {
        final requiredKeys = ['id', 'isoCode', 'name', 'flagUrl'];
        for (final key in requiredKeys) {
          final corruptedJson = Map<String, dynamic>.from(countryJson)
            ..remove(key);
          expect(
            () => Country.fromJson(corruptedJson),
            throwsA(isA<CheckedFromJsonException>()),
            reason: 'Should throw for missing key: $key',
          );
        }
      });
    });

    group('toJson', () {
      test('works correctly', () {
        expect(countryFixture.toJson(), equals(countryJson));
      });
    });
  });
}
