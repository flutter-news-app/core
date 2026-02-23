import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('SavedFilterLimits', () {
    final fullModel = remoteConfigsFixturesData[0]
        .user
        .limits
        .savedHeadlineFilters[AccessTier.standard]!;
    // A model with no notification subscriptions for testing minimal cases.
    const minimalModel = SavedFilterLimits(total: 5, pinned: 2);
    final fullJson = fullModel.toJson();
    final minimalJson = minimalModel.toJson();

    test('should be instantiable', () {
      expect(fullModel, isA<SavedFilterLimits>());
      expect(minimalModel, isA<SavedFilterLimits>());
    });

    test('should be equal to another instance with the same values', () {
      expect(
        fullModel,
        equals(
          const SavedFilterLimits(
            total: 25,
            pinned: 10,
            notificationSubscriptions: {
              PushNotificationSubscriptionDeliveryType.breakingOnly: 10,
            },
          ),
        ),
      );
    });

    test('should have the correct props', () {
      expect(
        fullModel.props,
        equals([
          fullModel.total,
          fullModel.pinned,
          {PushNotificationSubscriptionDeliveryType.breakingOnly: 10},
        ]),
      );
    });

    test('should correctly deserialize from json', () {
      expect(SavedFilterLimits.fromJson(fullJson), equals(fullModel));
      expect(SavedFilterLimits.fromJson(minimalJson), equals(minimalModel));
    });

    test('should correctly serialize to json', () {
      expect(fullModel.toJson(), equals(fullJson));
      expect(minimalModel.toJson(), equals(minimalJson));
    });

    test('copyWith should work correctly', () {
      final copied = fullModel.copyWith(total: 20, pinned: 10);
      expect(copied.total, 20);
      expect(copied.pinned, 10); // This was 10 in the original test
      expect(
        copied.notificationSubscriptions,
        fullModel.notificationSubscriptions,
      );
    });

    test('should handle empty notificationSubscriptions map', () {
      const model = SavedFilterLimits(
        total: 5,
        pinned: 2,
        notificationSubscriptions: {},
      );
      final json = model.toJson();
      final deserialized = SavedFilterLimits.fromJson(json);
      expect(deserialized, model);
      expect(deserialized.notificationSubscriptions, isEmpty);
    });
  });
}
