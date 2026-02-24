import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('Headline Model', () {
    // Use the first headline from the fixtures as the base for testing.
    final headlineFixture = getHeadlinesFixturesData().first;
    final headlineJson = headlineFixture.toJson();

    group('fromJson', () {
      test('should correctly deserialize from full JSON', () {
        final headline = Headline.fromJson(headlineJson);
        expect(headline, equals(headlineFixture));
      });
    });

    group('toJson', () {
      test('should correctly serialize to full JSON', () {
        final json = headlineFixture.toJson();
        expect(json, equals(headlineJson));
      });
    });

    group('copyWith', () {
      test('should create a copy with updated values', () {
        const updatedTitle = {SupportedLanguage.en: 'Updated Title'};
        const updatedUrl = 'http://example.com/updated';
        const updatedMediaAssetId = 'media-asset-id-456';
        final copiedHeadline = headlineFixture.copyWith(
          title: updatedTitle,
          url: updatedUrl,
          mediaAssetId: const ValueWrapper(updatedMediaAssetId),
        );

        expect(copiedHeadline.id, headlineFixture.id);
        expect(copiedHeadline.title, updatedTitle);
        expect(copiedHeadline.url, updatedUrl);
        expect(copiedHeadline.mediaAssetId, updatedMediaAssetId);
        expect(copiedHeadline.imageUrl, headlineFixture.imageUrl);
        expect(copiedHeadline.source, headlineFixture.source);
        expect(copiedHeadline.topic, headlineFixture.topic);
        expect(copiedHeadline.createdAt, headlineFixture.createdAt);
        expect(copiedHeadline.updatedAt, headlineFixture.updatedAt);
      });

      test('should create a copy with a null value using ValueWrapper', () {
        expect(headlineFixture.imageUrl, isNotNull);
        final copied = headlineFixture.copyWith(
          imageUrl: const ValueWrapper(null),
        );
        expect(copied.imageUrl, isNull);
      });

      test('should create an identical copy if no values are provided', () {
        final copiedHeadline = headlineFixture.copyWith();
        expect(copiedHeadline, equals(headlineFixture));
      });
    });

    group('Equatable', () {
      test('should equate two identical instances', () {
        final headline1 = headlineFixture.copyWith();
        final headline2 = headlineFixture.copyWith();
        expect(headline1, equals(headline2));
      });

      test('should not equate instances with different properties', () {
        final headline1 = headlineFixture.copyWith();
        final headline2 = headlineFixture.copyWith(
          title: {SupportedLanguage.en: 'Different Title'},
        );
        final headline3 = headlineFixture.copyWith(id: 'different-id');
        expect(headline1, isNot(equals(headline2)));
        expect(headline1, isNot(equals(headline3)));
      });

      test('props list should contain all relevant fields', () {
        expect(headlineFixture.props.length, 13);
        expect(headlineFixture.props, [
          headlineFixture.id,
          headlineFixture.title,
          headlineFixture.url,
          headlineFixture.imageUrl,
          headlineFixture.createdAt,
          headlineFixture.updatedAt,
          headlineFixture.status,
          headlineFixture.source,
          headlineFixture.eventCountry,
          headlineFixture.topic,
          headlineFixture.isBreaking,
          headlineFixture.mediaAssetId,
          headlineFixture.type,
        ]);
      });
    });
  });
}
