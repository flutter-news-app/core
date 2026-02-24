import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

void main() {
  group('Source Model', () {
    final sourceFixture = getSourcesFixturesData().first;
    final sourceJson = sourceFixture.toJson();

    group('Constructor', () {
      test('creates instance with all fields', () {
        expect(sourceFixture.id, isNotNull);
        expect(sourceFixture.name, isNotNull);
        expect(sourceFixture.description, isNotNull);
        expect(sourceFixture.url, isNotNull);
        expect(sourceFixture.logoUrl, isNotNull);
        expect(sourceFixture.sourceType, isNotNull);
        expect(sourceFixture.language, isNotNull);
        expect(sourceFixture.headquarters, isNotNull);
        expect(sourceFixture.status, isNotNull);
      });
    });

    group('Equatable Props and Equality', () {
      test('props list contains all relevant fields', () {
        expect(
          sourceFixture.props,
          equals([
            sourceFixture.id,
            sourceFixture.name,
            sourceFixture.description,
            sourceFixture.url,
            sourceFixture.logoUrl,
            sourceFixture.sourceType,
            sourceFixture.language,
            sourceFixture.headquarters,
            sourceFixture.createdAt,
            sourceFixture.updatedAt,
            sourceFixture.status,
            sourceFixture.mediaAssetId,
            'source',
          ]),
        );
      });

      test('instances with same props are equal', () {
        final source1 = sourceFixture.copyWith();
        final source2 = sourceFixture.copyWith();
        expect(source1, equals(source2));
        expect(source1.hashCode, equals(source2.hashCode));
      });

      test('instances with different props are not equal', () {
        final source1 = sourceFixture.copyWith();
        final source2 = sourceFixture.copyWith(id: 'different-id');
        final source3 = sourceFixture.copyWith(
          name: {SupportedLanguage.en: 'Different Name'},
        );
        expect(source1, isNot(equals(source2)));
        expect(source1.hashCode, isNot(equals(source2.hashCode)));
        expect(source1, isNot(equals(source3)));
        expect(source1.hashCode, isNot(equals(source3.hashCode)));
      });
    });

    group('JSON Serialization (toJson)', () {
      test('serializes full source correctly', () {
        final json = sourceFixture.toJson();
        expect(json, isA<Map<String, dynamic>>());
        expect(json, equals(sourceJson));
      });
    });

    group('JSON Deserialization (fromJson)', () {
      test('deserializes full JSON correctly', () {
        final source = Source.fromJson(sourceJson);
        expect(source, equals(sourceFixture));
      });

      test('handles unknown type string in JSON gracefully', () {
        final jsonWithUnknownType = Map<String, dynamic>.from(sourceJson)
          ..['sourceType'] = 'some_unknown_type';

        expect(
          () => Source.fromJson(jsonWithUnknownType),
          throwsA(isA<CheckedFromJsonException>()),
        );
      });
    });

    group('copyWith Method', () {
      test('creates an identical copy with no arguments', () {
        final copy = sourceFixture.copyWith();
        expect(copy, equals(sourceFixture));
        expect(copy.hashCode, equals(sourceFixture.hashCode));
        expect(identical(copy, sourceFixture), isFalse);
      });

      test('updates individual fields correctly', () {
        const updatedName = {SupportedLanguage.en: 'Updated Source Name'};
        const updatedLogo = 'https://example.com/logo.png';
        const updatedMediaAssetId = 'media-asset-id-123';
        final updatedCopy = sourceFixture.copyWith(
          name: updatedName,
          logoUrl: const ValueWrapper(updatedLogo),
          mediaAssetId: const ValueWrapper(updatedMediaAssetId),
        );
        expect(updatedCopy.name, updatedName);
        expect(updatedCopy.id, sourceFixture.id);
        expect(updatedCopy.logoUrl, updatedLogo);
        expect(updatedCopy.mediaAssetId, updatedMediaAssetId);
      });

      test('updates a field to null correctly', () {
        expect(sourceFixture.logoUrl, isNotNull);
        final updatedCopy = sourceFixture.copyWith(
          logoUrl: const ValueWrapper(null),
        );
        expect(updatedCopy.logoUrl, isNull);
      });

      test('updates multiple fields simultaneously', () {
        const updatedName = {SupportedLanguage.en: 'Multi Update Source'};
        const updatedType = SourceType.aggregator;
        const updatedStatus = ContentStatus.archived;
        final updatedCopy = sourceFixture.copyWith(
          name: updatedName,
          sourceType: updatedType,
          status: updatedStatus,
        );

        expect(updatedCopy.id, sourceFixture.id);
        expect(updatedCopy.name, updatedName);
        expect(updatedCopy.sourceType, updatedType);
        expect(updatedCopy.status, updatedStatus);
      });
    });
  });
}
