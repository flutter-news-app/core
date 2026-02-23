import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('UserLimitsConfig', () {
    final userLimitsConfigFixture = remoteConfigsFixturesData.first.user.limits;
    final json = userLimitsConfigFixture.toJson();

    test('can be instantiated', () {
      expect(userLimitsConfigFixture, isA<UserLimitsConfig>());
    });

    test('supports value equality', () {
      final anotherConfig = remoteConfigsFixturesData.first.user.limits;
      expect(userLimitsConfigFixture, equals(anotherConfig));
    });

    test('props are correct', () {
      expect(
        userLimitsConfigFixture.props,
        equals([
          userLimitsConfigFixture.followedItems,
          userLimitsConfigFixture.savedHeadlines,
          userLimitsConfigFixture.savedHeadlineFilters,
          userLimitsConfigFixture.reactionsPerDay,
          userLimitsConfigFixture.commentsPerDay,
          userLimitsConfigFixture.reportsPerDay,
        ]),
      );
    });

    test('can be created from JSON', () {
      final fromJson = UserLimitsConfig.fromJson(json);
      expect(fromJson, equals(userLimitsConfigFixture));
    });

    test('can be converted to JSON', () {
      final toJson = userLimitsConfigFixture.toJson();
      expect(toJson, equals(json));
    });

    test('copyWith creates a copy with updated values', () {
      final updatedConfig = userLimitsConfigFixture.copyWith(
        followedItems: {AccessTier.guest: 100, AccessTier.standard: 200},
      );

      expect(updatedConfig.followedItems[AccessTier.guest], 100);
      expect(
        updatedConfig.savedHeadlines,
        equals(userLimitsConfigFixture.savedHeadlines),
      );
      expect(updatedConfig, isNot(equals(userLimitsConfigFixture)));
    });

    test(
      'copyWith creates an identical copy when no arguments are provided',
      () {
        final copiedConfig = userLimitsConfigFixture.copyWith();
        expect(copiedConfig, equals(userLimitsConfigFixture));
      },
    );
  });
}
