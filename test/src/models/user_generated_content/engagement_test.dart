import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('Engagement', () {
    final now = DateTime.now();
    // Use the first item from the fixtures as the test subject.
    final engagementFixture = getEngagementsFixturesData(
      now: now,
      languageCode: 'en',
    ).first;

    group('constructor', () {
      test('returns correct instance', () {
        expect(engagementFixture, isA<Engagement>());
      });

      test('returns correct instance with comment and reaction', () {
        // The first fixture item should have a comment and a reaction
        expect(engagementFixture.comment, isNotNull);
        expect(engagementFixture.reaction, isNotNull);
      });

      test('returns correct instance with reaction only', () {
        // The second fixture item should have a reaction but no comment
        final engagementWithoutComment = getEngagementsFixturesData(
          now: now,
        )[1];
        expect(engagementWithoutComment.comment, isNull);
        expect(engagementWithoutComment.reaction, isNotNull);
      });

      test('returns correct instance with comment only', () {
        // The third fixture item should have a comment but no reaction
        final engagementWithoutReaction = getEngagementsFixturesData(
          now: now,
        )[2];
        expect(engagementWithoutReaction.comment, isNotNull);
        expect(engagementWithoutReaction.reaction, isNull);
      });
    });

    group('fromJson/toJson', () {
      test('round trip with all fields populated', () {
        final json = engagementFixture.toJson();
        final result = Engagement.fromJson(json);
        expect(result, equals(engagementFixture));
      });

      test('round trip with null comment (reaction only)', () {
        final engagementWithoutComment = getEngagementsFixturesData(
          now: now,
        )[1];
        final json = engagementWithoutComment.toJson();
        final result = Engagement.fromJson(json);
        expect(result, equals(engagementWithoutComment));
      });

      test('round trip with null reaction (comment only)', () {
        final engagementWithCommentOnly = getEngagementsFixturesData(
          now: now,
        )[2];
        final json = engagementWithCommentOnly.toJson();
        final result = Engagement.fromJson(json);
        expect(result, equals(engagementWithCommentOnly));
      });
    });

    group('copyWith', () {
      test('returns a new instance with updated fields', () {
        final newReaction = reactionsFixturesData[2];

        final updatedEngagement = engagementFixture.copyWith(
          reaction: ValueWrapper(newReaction),
        );

        expect(updatedEngagement.reaction, newReaction);
        // Verify other fields remain unchanged
        expect(updatedEngagement.id, engagementFixture.id);
        expect(updatedEngagement.userId, engagementFixture.userId);
        expect(updatedEngagement.entityId, engagementFixture.entityId);
        expect(updatedEngagement.comment, engagementFixture.comment);
        expect(updatedEngagement.createdAt, engagementFixture.createdAt);
        // The updatedAt timestamp should be different
        expect(
          updatedEngagement.updatedAt,
          isNot(equals(engagementFixture.updatedAt)),
        );
      });

      test('returns a new instance with a null reaction', () {
        // Start with a fixture that has a reaction.
        final updatedEngagement = engagementFixture.copyWith(
          reaction: const ValueWrapper(null),
        );

        expect(updatedEngagement.reaction, isNull);
        // Verify other fields remain unchanged
        expect(updatedEngagement.id, engagementFixture.id);
      });

      test('returns a new instance with an updated comment', () {
        const newComment = Comment(
          language: SupportedLanguage.en,
          content: 'This is a new comment.',
          status: ModerationStatus.resolved,
        );

        final updatedEngagement = engagementFixture.copyWith(
          comment: const ValueWrapper(newComment),
        );

        expect(updatedEngagement.comment, newComment);
        expect(updatedEngagement.id, engagementFixture.id);
      });

      test('returns a new instance with a null comment', () {
        // Start with a fixture that has a comment.
        final updatedEngagement = engagementFixture.copyWith(
          comment: const ValueWrapper(null),
        );

        expect(updatedEngagement.comment, isNull);
        // Verify other fields remain unchanged
        expect(updatedEngagement.id, engagementFixture.id);
      });

      test(
        'returns a new instance with a new timestamp if no updates provided',
        () {
          final copiedEngagement = engagementFixture.copyWith();
          expect(copiedEngagement, isNot(equals(engagementFixture)));
          expect(copiedEngagement.id, engagementFixture.id);
        },
      );
    });

    group('Equatable', () {
      test('instances with the same properties are equal', () {
        final engagement1 = getEngagementsFixturesData(
          now: now,
          languageCode: 'en',
        ).first;
        final engagement2 = getEngagementsFixturesData(
          now: now,
          languageCode: 'en',
        ).first;
        expect(engagement1, equals(engagement2));
      });

      test('instances with different properties are not equal', () {
        final engagement1 = getEngagementsFixturesData(now: now)[0];
        final engagement2 = getEngagementsFixturesData(now: now)[1];
        expect(engagement1, isNot(equals(engagement2)));
      });
    });

    test('props list should contain all relevant fields', () {
      expect(engagementFixture.props, [
        engagementFixture.id,
        engagementFixture.userId,
        engagementFixture.entityId,
        engagementFixture.entityType,
        engagementFixture.reaction,
        engagementFixture.comment,
        engagementFixture.createdAt,
        engagementFixture.updatedAt,
      ]);
    });
  });
}
