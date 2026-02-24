import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('RankedListItem Model', () {
    final rankedListItemFixture =
        getRankedListCardsFixturesData().first.timeFrames.values.first.first;
    final rankedListItemJson = rankedListItemFixture.toJson();

    group('fromJson', () {
      test('should correctly deserialize from JSON', () {
        final fromJson = RankedListItem.fromJson(rankedListItemJson);
        expect(fromJson, equals(rankedListItemFixture));
      });
    });

    group('toJson', () {
      test('should correctly serialize to JSON', () {
        final toJson = rankedListItemFixture.toJson();
        expect(toJson, equals(rankedListItemJson));
      });
    });

    group('copyWith', () {
      test('should return a new instance with updated values', () {
        final updatedItem = rankedListItemFixture.copyWith(
          displayTitle: {SupportedLanguage.en: 'A New Title'},
          metricValue: 999,
        );

        expect(updatedItem.displayTitle, {SupportedLanguage.en: 'A New Title'});
        expect(updatedItem.metricValue, 999);
        expect(updatedItem.entityId, rankedListItemFixture.entityId);
      });

      test('should return an identical instance if no values are provided', () {
        final copiedItem = rankedListItemFixture.copyWith();
        expect(copiedItem, equals(rankedListItemFixture));
      });
    });

    group('Equatable', () {
      test('should equate two identical instances', () {
        final instance1 = rankedListItemFixture;
        final instance2 = RankedListItem.fromJson(
          rankedListItemFixture.toJson(),
        );
        expect(instance1, equals(instance2));
      });

      test('should not equate instances with different properties', () {
        final instance1 = rankedListItemFixture;
        final instance2 = RankedListItem(
          entityId: 'different-id',
          displayTitle: rankedListItemFixture.displayTitle,
          metricValue: rankedListItemFixture.metricValue,
        );
        final instance3 = RankedListItem(
          entityId: rankedListItemFixture.entityId,
          displayTitle: const {SupportedLanguage.en: 'Different Title'},
          metricValue: rankedListItemFixture.metricValue,
        );
        expect(instance1, isNot(equals(instance2)));
        expect(instance1, isNot(equals(instance3)));
      });

      test('props list should contain all relevant fields', () {
        expect(rankedListItemFixture.props, [
          rankedListItemFixture.entityId,
          rankedListItemFixture.displayTitle,
          rankedListItemFixture.metricValue,
        ]);
      });
    });
  });
}
