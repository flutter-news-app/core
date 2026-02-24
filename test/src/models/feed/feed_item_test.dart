import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('FeedItem', () {
    final mockHeadline = getHeadlinesFixturesData().first;
    final mockTopic = getTopicsFixturesData().first;
    final mockSource = getSourcesFixturesData().first;
    final mockCountry = countriesFixturesData.first;

    const mockCallToAction = CallToActionItem(
      id: 'cta-1',
      decoratorType: FeedDecoratorType.linkAccount,
      title: {SupportedLanguage.en: 'Link Account'},
      description: {
        SupportedLanguage.en: 'Link your account to save your progress.',
      },
      callToActionText: {SupportedLanguage.en: 'Link Account'},
      callToActionUrl: 'https://example.com/link-account',
    );

    final mockContentCollectionTopic = ContentCollectionItem<Topic>(
      id: 'cc-topic-1',
      decoratorType: FeedDecoratorType.suggestedTopics,
      items: getTopicsFixturesData().take(3).toList(),
      title: const {SupportedLanguage.en: 'Suggested Topics'},
    );

    final mockContentCollectionSource = ContentCollectionItem<Source>(
      id: 'cc-source-1',
      decoratorType: FeedDecoratorType.suggestedSources,
      items: getSourcesFixturesData().take(3).toList(),
      title: const {SupportedLanguage.en: 'Suggested Sources'},
    );

    group('fromJson', () {
      test('dispatches to Headline.fromJson', () {
        final json = mockHeadline.toJson();
        final feedItem = FeedItem.fromJson(json);
        expect(feedItem, isA<Headline>());
        expect(feedItem, equals(mockHeadline));
      });

      test('dispatches to Topic.fromJson', () {
        final json = mockTopic.toJson();
        final feedItem = FeedItem.fromJson(json);
        expect(feedItem, isA<Topic>());
        expect(feedItem, equals(mockTopic));
      });

      test('dispatches to Source.fromJson', () {
        final json = mockSource.toJson();
        final feedItem = FeedItem.fromJson(json);
        expect(feedItem, isA<Source>());
        expect(feedItem, equals(mockSource));
      });

      test('dispatches to Country.fromJson', () {
        final json = mockCountry.toJson();
        final feedItem = FeedItem.fromJson(json);
        expect(feedItem, isA<Country>());
        expect(feedItem, equals(mockCountry));
      });

      test('dispatches to CallToAction.fromJson', () {
        final json = mockCallToAction.toJson();
        final feedItem = FeedItem.fromJson(json);
        expect(feedItem, isA<CallToActionItem>());
        expect(feedItem, equals(mockCallToAction));
      });

      test('dispatches to ContentCollectionItem<Topic>.fromJson', () {
        final json = mockContentCollectionTopic.toJson(
          (topic) => topic.toJson(),
        );
        final feedItem = FeedItem.fromJson(json);
        expect(feedItem, isA<ContentCollectionItem<Topic>>());
        expect(feedItem, equals(mockContentCollectionTopic));
      });

      test('dispatches to ContentCollectionItem<Source>.fromJson', () {
        final json = mockContentCollectionSource.toJson(
          (source) => source.toJson(),
        );
        final feedItem = FeedItem.fromJson(json);
        expect(feedItem, isA<ContentCollectionItem<Source>>());
        expect(feedItem, equals(mockContentCollectionSource));
      });

      test(
        'throws FormatException for contentCollection if contentType is missing',
        () {
          final json = <String, dynamic>{
            'type': 'contentCollection',
            'id': 'cc-1',
          };
          expect(
            () => FeedItem.fromJson(json),
            throwsA(
              isA<FormatException>().having(
                (e) => e.message,
                'message',
                'Missing "contentType" for contentCollection.',
              ),
            ),
          );
        },
      );

      test(
        'throws FormatException for contentCollection if contentType is unknown',
        () {
          final json = <String, dynamic>{
            'type': 'contentCollection',
            'contentType': 'unknown_content',
            'id': 'cc-1',
          };
          expect(
            () => FeedItem.fromJson(json),
            throwsA(
              isA<FormatException>().having(
                (e) => e.message,
                'message',
                'Unknown contentType: unknown_content',
              ),
            ),
          );
        },
      );

      test('throws FormatException if type is missing', () {
        final json = <String, dynamic>{'id': 'some-id'};
        expect(
          () => FeedItem.fromJson(json),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'message',
              'Missing "type" field in FeedItem JSON.',
            ),
          ),
        );
      });

      test('throws FormatException if type is unknown', () {
        final json = <String, dynamic>{'type': 'unknown_type'};
        expect(
          () => FeedItem.fromJson(json),
          throwsA(
            isA<FormatException>().having(
              (e) => e.message,
              'message',
              'Unknown FeedItem type: unknown_type',
            ),
          ),
        );
      });
    });

    group('toJson', () {
      test('serializes Headline correctly', () {
        final json = mockHeadline.toJson();
        final deserialized = FeedItem.fromJson(json) as Headline;
        expect(deserialized.toJson(), equals(json));
      });

      test('serializes Topic correctly', () {
        final json = mockTopic.toJson();
        final deserialized = FeedItem.fromJson(json) as Topic;
        expect(deserialized.toJson(), equals(json));
      });

      test('serializes Source correctly', () {
        final json = mockSource.toJson();
        final deserialized = FeedItem.fromJson(json) as Source;
        expect(deserialized.toJson(), equals(json));
      });

      test('serializes Country correctly', () {
        final json = mockCountry.toJson();
        final deserialized = FeedItem.fromJson(json) as Country;
        expect(deserialized.toJson(), equals(json));
      });

      test('serializes CallToAction correctly', () {
        final json = mockCallToAction.toJson();
        final deserialized = FeedItem.fromJson(json) as CallToActionItem;
        expect(deserialized.toJson(), equals(json));
      });

      test('serializes ContentCollectionItem<Topic> correctly', () {
        final json = mockContentCollectionTopic.toJson(
          (topic) => topic.toJson(),
        );
        final deserialized =
            FeedItem.fromJson(json) as ContentCollectionItem<Topic>;
        expect(deserialized.toJson((topic) => topic.toJson()), equals(json));
      });
    });
  });
}
