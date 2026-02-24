import 'package:core/core.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:test/test.dart';

void main() {
  group('Topic', () {
    final topicFixture = getTopicsFixturesData().first;
    final topicJson = topicFixture.toJson();

    test('supports value equality', () {
      final topic1 = topicFixture.copyWith();
      final topic2 = topicFixture.copyWith();
      expect(topic1, equals(topic2));
    });

    test('constructor sets type to "topic"', () {
      expect(topicFixture.type, 'topic');
    });

    test('props list contains all relevant fields', () {
      expect(topicFixture.props, [
        topicFixture.id,
        topicFixture.name,
        topicFixture.description,
        topicFixture.iconUrl,
        topicFixture.createdAt,
        topicFixture.updatedAt,
        topicFixture.status,
        topicFixture.mediaAssetId,
        'topic',
      ]);
    });

    group('fromJson', () {
      test('creates correct Topic object from valid JSON', () {
        expect(Topic.fromJson(topicJson), equals(topicFixture));
      });

      test(
        'throws CheckedFromJsonException when required fields are missing',
        () {
          final json = <String, dynamic>{'name': 'Art', 'type': 'topic'};
          expect(
            () => Topic.fromJson(json),
            throwsA(isA<CheckedFromJsonException>()),
          );
        },
      );

      test('deserializes with a non-default status', () {
        final archivedTopic = topicFixture.copyWith(
          status: ContentStatus.archived,
        );
        final json = archivedTopic.toJson();
        final topic = Topic.fromJson(json);
        expect(topic.status, ContentStatus.archived);
      });
    });

    group('toJson', () {
      test('produces correct JSON map', () {
        expect(topicFixture.toJson(), equals(topicJson));
      });
    });

    group('copyWith', () {
      test('returns a new object with updated name', () {
        final updated = topicFixture.copyWith(
          name: {SupportedLanguage.en: 'New Name'},
        );
        expect(updated.name, {SupportedLanguage.en: 'New Name'});
        expect(updated.id, topicFixture.id);
      });

      test('returns a new object with a null value', () {
        expect(topicFixture.iconUrl, isNotNull);
        final updated = topicFixture.copyWith(
          iconUrl: const ValueWrapper(null),
        );
        expect(updated.iconUrl, isNull);
      });

      test('returns a new object with multiple updated properties', () {
        final updated = topicFixture.copyWith(
          mediaAssetId: const ValueWrapper('new-media-id'),
          name: {SupportedLanguage.en: 'Updated'},
          description: {SupportedLanguage.en: 'Updated Desc'},
          status: ContentStatus.archived,
        );
        expect(updated.mediaAssetId, 'new-media-id');
        expect(updated.name, {SupportedLanguage.en: 'Updated'});
        expect(updated.description, {SupportedLanguage.en: 'Updated Desc'});
        expect(updated.status, ContentStatus.archived);
        expect(updated.id, topicFixture.id);
      });
    });
  });
}
