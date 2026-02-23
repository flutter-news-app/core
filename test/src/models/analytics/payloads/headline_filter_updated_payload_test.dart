import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('HeadlineFilterUpdatedPayload', () {
    const criteriaSummary = HeadlineFilterCriteriaSummary(
      criteriaTypes: ['topic'],
      topicCount: 1,
      sourceCount: 0,
      countryCount: 0,
    );

    const payload = HeadlineFilterUpdatedPayload(
      filterId: 'filter-123',
      newName: 'New Filter Name',
      pinStatusChangedTo: true,
      deliveryTypesAdded: const [],
      deliveryTypesRemoved: [
        PushNotificationSubscriptionDeliveryType.breakingOnly,
      ],
      newCriteriaSummary: criteriaSummary,
    );

    group('Constructor', () {
      test('should throw assertion error if no changes are provided', () {
        expect(
          () => HeadlineFilterUpdatedPayload(filterId: 'filter-123'),
          throwsA(isA<AssertionError>()),
        );
      });
    });

    group('toMap', () {
      test('should correctly serialize to a map with all fields', () {
        final map = payload.toMap();
        expect(map, {
          AnalyticsParameterKeys.filterId: 'filter-123',
          'newName': 'New Filter Name',
          'pinStatusChangedTo': true,
          'deliveryTypesAdded': <String>[],
          'deliveryTypesRemoved': ['breakingOnly'],
          'newCriteriaSummary': criteriaSummary.toJson(),
        });
      });

      test('should correctly serialize to a map with only one change', () {
        const singleChangePayload = HeadlineFilterUpdatedPayload(
          filterId: 'filter-123',
          pinStatusChangedTo: false,
        );
        final map = singleChangePayload.toMap();
        expect(map, {
          AnalyticsParameterKeys.filterId: 'filter-123',
          'pinStatusChangedTo': false,
        });
      });
    });

    group('Equatable', () {
      test('should equate two identical instances', () {
        const instance1 = payload;
        const instance2 = HeadlineFilterUpdatedPayload(
          filterId: 'filter-123',
          newName: 'New Filter Name',
          pinStatusChangedTo: true,
          deliveryTypesAdded: const [],
          deliveryTypesRemoved: [
            PushNotificationSubscriptionDeliveryType.breakingOnly,
          ],
          newCriteriaSummary: criteriaSummary,
        );
        expect(instance1, equals(instance2));
      });

      test('should not equate instances with different properties', () {
        const instance1 = payload;
        const instance2 = HeadlineFilterUpdatedPayload(
          filterId: 'filter-123',
          newName: 'Another Name',
        );
        expect(instance1, isNot(equals(instance2)));
      });
    });
  });
}
