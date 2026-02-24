import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('AppConfig', () {
    final appConfigFixture = remoteConfigsFixturesData.first.app;
    final json = appConfigFixture.toJson();

    test('can be instantiated', () {
      expect(appConfigFixture, isA<AppConfig>());
    });

    test('supports value equality', () {
      final anotherConfig = remoteConfigsFixturesData.first.app;
      expect(appConfigFixture, equals(anotherConfig));
    });

    test('props are correct', () {
      expect(
        appConfigFixture.props,
        equals([
          appConfigFixture.maintenance,
          appConfigFixture.update,
          appConfigFixture.general,
          appConfigFixture.localization,
        ]),
      );
    });

    test('can be created from JSON', () {
      final fromJson = AppConfig.fromJson(json);
      expect(fromJson, equals(appConfigFixture));
    });

    test('can be converted to JSON', () {
      final toJson = appConfigFixture.toJson();
      expect(toJson, equals(json));
    });

    test('copyWith creates a copy with updated values', () {
      final updatedConfig = appConfigFixture.copyWith(
        maintenance: const MaintenanceConfig(isUnderMaintenance: true),
      );

      expect(updatedConfig.maintenance.isUnderMaintenance, isTrue);
      expect(updatedConfig.update, equals(appConfigFixture.update));
      expect(updatedConfig, isNot(equals(appConfigFixture)));
    });

    test(
      'copyWith creates an identical copy when no arguments are provided',
      () {
        final copiedConfig = appConfigFixture.copyWith();
        expect(copiedConfig, equals(appConfigFixture));
      },
    );
  });
}
