import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('HeadlineFilterCreatedPayload', () {
    const criteriaSummary = HeadlineFilterCriteriaSummary(
      criteriaTypes: ['topic', 'source'],
      topicCount: 2,
      sourceCount: 1,
      countryCount: 0,
    );

    const payload = HeadlineFilterCreatedPayload(
      filterId: 'filter-123',
      criteriaSummary: criteriaSummary,
      isPinned: true,
      deliveryTypes: {PushNotificationSubscriptionDeliveryType.breakingOnly},
    );

    const payloadWithLimits = HeadlineFilterCreatedPayload(
      filterId: 'filter-456',
      criteriaSummary: criteriaSummary,
      isPinned: false,
      deliveryTypes: {},
      wasPinningLimited: true,
    );

    group('toMap', () {
      test('should correctly serialize a standard payload to a map', () {
        final map = payload.toMap();
        expect(map, {
          AnalyticsParameterKeys.filterId: 'filter-123',
          AnalyticsParameterKeys.isPinned: true,
          AnalyticsParameterKeys.criteriaSummary: criteriaSummary.toJson(),
          AnalyticsParameterKeys.deliveryTypes: ['breakingOnly'],
        });
      });

      test('should correctly serialize a payload with limits to a map', () {
        final map = payloadWithLimits.toMap();
        expect(map, {
          AnalyticsParameterKeys.filterId: 'filter-456',
          AnalyticsParameterKeys.isPinned: false,
          AnalyticsParameterKeys.criteriaSummary: criteriaSummary.toJson(),
          AnalyticsParameterKeys.deliveryTypes: <String>[],
          'wasPinningLimited': true,
        });
      });
    });

    group('Equatable', () {
      test('should equate two identical instances', () {
        const instance1 = payload;
        const instance2 = HeadlineFilterCreatedPayload(
          filterId: 'filter-123',
          criteriaSummary: criteriaSummary,
          isPinned: true,
          deliveryTypes: {
            PushNotificationSubscriptionDeliveryType.breakingOnly,
          },
        );
        expect(instance1, equals(instance2));
      });

      test('should not equate instances with different properties', () {
        expect(payload, isNot(equals(payloadWithLimits)));
      });
    });
  });
}
