import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('ContentCollectionItem', () {
    final mockTopics = getTopicsFixturesData().take(3).toList();
    final mockSources = getSourcesFixturesData().take(3).toList();

    final mockTopicCollection = ContentCollectionItem<Topic>(
      id: 'cc-topic-1',
      decoratorType: FeedDecoratorType.suggestedTopics,
      items: mockTopics,
      title: const {SupportedLanguage.en: 'Suggested Topics'},
    );

    final mockSourceCollection = ContentCollectionItem<Source>(
      id: 'cc-source-1',
      decoratorType: FeedDecoratorType.suggestedSources,
      items: mockSources,
      title: const {SupportedLanguage.en: 'Suggested Sources'},
    );

    group('constructor', () {
      test('throws AssertionError if items is empty', () {
        expect(
          () => ContentCollectionItem<Topic>(
            id: 'cc-topic-1',
            decoratorType: FeedDecoratorType.suggestedTopics,
            items: const [],
            title: const {SupportedLanguage.en: 'Suggested Topics'},
          ),
          throwsA(isA<AssertionError>()),
        );
      });
    });

    group('supports value equality', () {
      test('for Topic collection', () {
        final item1 = ContentCollectionItem<Topic>(
          id: 'cc-topic-1',
          decoratorType: FeedDecoratorType.suggestedTopics,
          items: mockTopics,
          title: const {SupportedLanguage.en: 'Suggested Topics'},
        );
        expect(item1, equals(mockTopicCollection));
      });

      test('for Source collection', () {
        final item1 = ContentCollectionItem<Source>(
          id: 'cc-source-1',
          decoratorType: FeedDecoratorType.suggestedSources,
          items: mockSources,
          title: const {SupportedLanguage.en: 'Suggested Sources'},
        );
        expect(item1, equals(mockSourceCollection));
      });
    });

    group('props are correct', () {
      test('for Topic collection', () {
        expect(mockTopicCollection.props, [
          mockTopicCollection.id,
          mockTopicCollection.decoratorType,
          mockTopicCollection.title,
          mockTopicCollection.items,
          mockTopicCollection.type,
        ]);
      });

      test('for Source collection', () {
        expect(mockSourceCollection.props, [
          mockSourceCollection.id,
          mockSourceCollection.decoratorType,
          mockSourceCollection.title,
          mockSourceCollection.items,
          mockSourceCollection.type,
        ]);
      });
    });

    group('JSON serialization', () {
      test('works correctly for Topic collection', () {
        final json = mockTopicCollection.toJson((topic) => topic.toJson());
        final fromJson = ContentCollectionItem.fromJson(
          json,
          (json) => Topic.fromJson(json! as Map<String, dynamic>),
        );
        expect(fromJson, equals(mockTopicCollection));
      });

      test('works correctly for Source collection', () {
        final json = mockSourceCollection.toJson((source) => source.toJson());
        final fromJson = ContentCollectionItem.fromJson(
          json,
          (json) => Source.fromJson(json! as Map<String, dynamic>),
        );
        expect(fromJson, equals(mockSourceCollection));
      });
    });
  });
}
