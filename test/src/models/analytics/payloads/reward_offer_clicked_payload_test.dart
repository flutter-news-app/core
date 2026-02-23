import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('RewardOfferClickedPayload', () {
    const payload = RewardOfferClickedPayload(rewardType: RewardType.adFree);

    group('toMap', () {
      test('should correctly serialize to a map', () {
        final map = payload.toMap();
        expect(map, {AnalyticsParameterKeys.rewardType: 'adFree'});
      });
    });

    group('Equatable', () {
      test('should equate two identical instances', () {
        const instance1 = RewardOfferClickedPayload(
          rewardType: RewardType.adFree,
        );
        const instance2 = RewardOfferClickedPayload(
          rewardType: RewardType.adFree,
        );
        expect(instance1, equals(instance2));
      });

      test('props list should contain all relevant fields', () {
        expect(payload.props, [payload.rewardType]);
      });
    });
  });
}
