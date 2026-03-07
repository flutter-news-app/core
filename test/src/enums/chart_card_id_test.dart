import 'package:core/src/enums/chart_card_id.dart';
import 'package:test/test.dart';

void main() {
  group('ChartCardId', () {
    test('has correct number of values', () {
      // This test is fragile and will need updates if the enum changes.
      expect(ChartCardId.values.length, 31);
    });

    test('has correct string names', () {
      expect(
        ChartCardId.usersRegistrationsOverTime.name,
        'usersRegistrationsOverTime',
      );
      expect(
        ChartCardId.engagementsAppReviewsStoreRequestsOverTime.name,
        'engagementsAppReviewsStoreRequestsOverTime',
      );
      expect(
        ChartCardId.ingestionHeadlinesOverTime.name,
        'ingestionHeadlinesOverTime',
      );
    });

    test('can be created from string names', () {
      expect(
        ChartCardId.values.byName('usersRegistrationsOverTime'),
        ChartCardId.usersRegistrationsOverTime,
      );
    });
  });
}
