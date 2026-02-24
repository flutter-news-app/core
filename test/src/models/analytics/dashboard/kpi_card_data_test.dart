import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('KpiTimeFrameData Model', () {
    const kpiTimeFrameDataFixture = KpiTimeFrameData(value: 100, trend: '+10%');
    final kpiTimeFrameDataJson = kpiTimeFrameDataFixture.toJson();

    group('fromJson', () {
      test('should correctly deserialize from JSON', () {
        final fromJson = KpiTimeFrameData.fromJson(kpiTimeFrameDataJson);
        expect(fromJson, equals(kpiTimeFrameDataFixture));
      });
    });

    group('toJson', () {
      test('should correctly serialize to JSON', () {
        final toJson = kpiTimeFrameDataFixture.toJson();
        expect(toJson, equals(kpiTimeFrameDataJson));
      });
    });

    group('copyWith', () {
      test('should return a new instance with updated values', () {
        final updatedData = kpiTimeFrameDataFixture.copyWith(
          value: 150,
          trend: '-5%',
        );

        expect(updatedData.value, 150);
        expect(updatedData.trend, '-5%');
      });

      test('should return an identical instance if no values are provided', () {
        final copiedData = kpiTimeFrameDataFixture.copyWith();
        expect(copiedData, equals(kpiTimeFrameDataFixture));
      });
    });

    group('Equatable', () {
      test('should equate two identical instances', () {
        const instance1 = KpiTimeFrameData(value: 100, trend: '+10%');
        const instance2 = KpiTimeFrameData(value: 100, trend: '+10%');
        expect(instance1, equals(instance2));
      });

      test('should not equate instances with different properties', () {
        const instance1 = KpiTimeFrameData(value: 100, trend: '+10%');
        const instance2 = KpiTimeFrameData(value: 99, trend: '+10%');
        const instance3 = KpiTimeFrameData(value: 100, trend: '-5%');
        expect(instance1, isNot(equals(instance2)));
        expect(instance1, isNot(equals(instance3)));
      });

      test('props list should contain all relevant fields', () {
        expect(kpiTimeFrameDataFixture.props, [
          kpiTimeFrameDataFixture.value,
          kpiTimeFrameDataFixture.trend,
        ]);
      });
    });
  });

  group('KpiCardData Model', () {
    final kpiCardDataFixture = getKpiCardsFixturesData().first;
    final kpiCardDataJson = kpiCardDataFixture.toJson();

    group('fromJson', () {
      test('should correctly deserialize from JSON', () {
        final fromJson = KpiCardData.fromJson(kpiCardDataJson);
        expect(fromJson, equals(kpiCardDataFixture));
      });
    });

    group('toJson', () {
      test('should correctly serialize to JSON', () {
        final toJson = kpiCardDataFixture.toJson();
        expect(toJson, equals(kpiCardDataJson));
      });
    });

    group('copyWith', () {
      test('should return a new instance with updated values', () {
        final updatedCard = kpiCardDataFixture.copyWith(
          label: {SupportedLanguage.en: 'A New Label'},
          cardId: KpiCardId.usersActiveUsers,
        );

        expect(updatedCard.label, {SupportedLanguage.en: 'A New Label'});
        expect(updatedCard.cardId, KpiCardId.usersActiveUsers);
        expect(updatedCard.id, kpiCardDataFixture.id);
        expect(updatedCard.timeFrames, equals(kpiCardDataFixture.timeFrames));
      });

      test('should return an identical instance if no values are provided', () {
        final copiedCard = kpiCardDataFixture.copyWith();
        expect(copiedCard, equals(kpiCardDataFixture));
      });
    });

    group('Equatable', () {
      test('should equate two identical instances', () {
        final instance1 = kpiCardDataFixture;
        final instance2 = KpiCardData.fromJson(kpiCardDataFixture.toJson());
        expect(instance1, equals(instance2));
      });

      test('should not equate instances with different properties', () {
        final instance1 = kpiCardDataFixture;
        final instance2 = KpiCardData(
          id: 'different-id', // Different ID
          cardId: kpiCardDataFixture.cardId,
          label: kpiCardDataFixture.label,
          timeFrames: kpiCardDataFixture.timeFrames,
        );
        final instance3 = KpiCardData(
          id: kpiCardDataFixture.id,
          cardId: kpiCardDataFixture.cardId,
          label: const {SupportedLanguage.en: 'Different Label'},
          timeFrames: kpiCardDataFixture.timeFrames,
        );
        expect(instance1, isNot(equals(instance2)));
        expect(instance1, isNot(equals(instance3)));
      });

      test('props list should contain all relevant fields', () {
        expect(kpiCardDataFixture.props, [
          kpiCardDataFixture.id,
          kpiCardDataFixture.cardId,
          kpiCardDataFixture.label,
          kpiCardDataFixture.timeFrames,
        ]);
      });
    });
  });
}
