import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('PushNotificationPayload', () {
    // Use a fixture to ensure consistency and avoid manual setup.
    final payload = inAppNotificationsFixturesData.first.payload;
    final json = payload.toJson();

    test('supports value equality', () {
      // Arrange: Create another instance with the same values.
      final anotherPayload = payload.copyWith();

      // Assert: The two instances should be equal.
      expect(payload, equals(anotherPayload));
    });

    test('props are correct', () {
      // Assert: The props list should contain all the fields.
      expect(
        payload.props,
        equals([
          payload.title,
          payload.notificationId,
          payload.notificationType,
          payload.contentType,
          payload.contentId,
          payload.imageUrl,
        ]),
      );
    });

    test('can be created from JSON', () {
      // Act: Create an instance from the JSON map.
      final fromJson = PushNotificationPayload.fromJson(json);

      // Assert: The created instance should be equal to the original.
      expect(fromJson, equals(payload));
    });

    test('can be converted to JSON', () {
      // Act: Convert the instance to a JSON map.
      final toJson = payload.toJson();

      // Assert: The resulting map should match the original JSON map.
      expect(toJson, equals(json));
    });

    test('copyWith creates a copy with updated values', () {
      // Arrange: Define the updated values.
      const newTitle = 'Updated News';
      const newContentId = 'new-content-id';

      // Act: Create a copy with the updated values.
      final copiedPayload = payload.copyWith(
        title: newTitle,
        contentId: newContentId,
      );

      // Assert: The new instance should have the updated values.
      expect(copiedPayload.title, equals(newTitle));
      expect(copiedPayload.contentId, equals(newContentId));
      expect(copiedPayload.imageUrl, equals(payload.imageUrl));
      expect(copiedPayload.notificationId, equals(payload.notificationId));

      // Assert: The original instance should remain unchanged.
      expect(payload.title, isNot(equals(newTitle)));
    });

    test(
      'copyWith creates an identical copy when no arguments are provided',
      () {
        // Act: Create a copy without providing any arguments.
        final copiedPayload = payload.copyWith();

        // Assert: The copied instance should be equal to the original.
        expect(copiedPayload, equals(payload));
      },
    );
  });
}
