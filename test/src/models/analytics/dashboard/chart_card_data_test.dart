import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('ChartCardData Model', () {
    final chartCardDataFixture = getChartCardsFixturesData().first;
    final chartCardDataJson = chartCardDataFixture.toJson();

    group('fromJson', () {
      test('should correctly deserialize from JSON', () {
        final fromJson = ChartCardData.fromJson(chartCardDataJson);
        expect(fromJson, equals(chartCardDataFixture));
      });
    });

    group('toJson', () {
      test('should correctly serialize to JSON', () {
        final toJson = chartCardDataFixture.toJson();
        expect(toJson, equals(chartCardDataJson));
      });
    });

    group('copyWith', () {
      test('should return a new instance with updated values', () {
        final updatedCard = chartCardDataFixture.copyWith(
          label: {SupportedLanguage.en: 'A New Label'},
          cardId: ChartCardId.usersActiveUsersOverTime,
          type: ChartType.bar,
        );

        expect(updatedCard.label, {SupportedLanguage.en: 'A New Label'});
        expect(updatedCard.cardId, ChartCardId.usersActiveUsersOverTime);
        expect(updatedCard.type, ChartType.bar);
        expect(updatedCard.id, chartCardDataFixture.id);
        expect(updatedCard.timeFrames, equals(chartCardDataFixture.timeFrames));
      });

      test('should return an identical instance if no values are provided', () {
        final copiedCard = chartCardDataFixture.copyWith();
        expect(copiedCard, equals(chartCardDataFixture));
      });
    });

    group('Equatable', () {
      test('should equate two identical instances', () {
        final instance1 = chartCardDataFixture;
        final instance2 = ChartCardData.fromJson(chartCardDataFixture.toJson());
        expect(instance1, equals(instance2));
      });

      test('should not equate instances with different properties', () {
        final instance1 = chartCardDataFixture;
        final instance2 = ChartCardData(
          id: 'different-id', // Different ID
          cardId: chartCardDataFixture.cardId,
          label: chartCardDataFixture.label,
          type: chartCardDataFixture.type,
          timeFrames: chartCardDataFixture.timeFrames,
        );
        final instance3 = ChartCardData(
          id: chartCardDataFixture.id,
          cardId: chartCardDataFixture.cardId,
          label: const {SupportedLanguage.en: 'Different Label'},
          type: chartCardDataFixture.type,
          timeFrames: chartCardDataFixture.timeFrames,
        );
        final instance4 = ChartCardData(
          id: chartCardDataFixture.id,
          cardId: chartCardDataFixture.cardId,
          label: chartCardDataFixture.label,
          type: ChartType.bar, // Different type
          timeFrames: chartCardDataFixture.timeFrames,
        );
        expect(instance1, isNot(equals(instance2)));
        expect(instance1, isNot(equals(instance3)));
        expect(instance1, isNot(equals(instance4)));
      });

      test('props list should contain all relevant fields', () {
        expect(chartCardDataFixture.props, [
          chartCardDataFixture.id,
          chartCardDataFixture.cardId,
          chartCardDataFixture.label,
          chartCardDataFixture.type,
          chartCardDataFixture.timeFrames,
        ]);
      });
    });
  });
}
