import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('AppSettings', () {
    final appSettingsFixture = appSettingsFixturesData.first;

    test('supports value equality', () {
      final settings1 = appSettingsFixture.copyWith();
      final settings2 = appSettingsFixture.copyWith();
      expect(settings1, equals(settings2));
    });

    test('props are correct', () {
      expect(
        appSettingsFixture.props,
        equals([
          appSettingsFixture.id,
          appSettingsFixture.displaySettings,
          appSettingsFixture.language,
          appSettingsFixture.feedSettings,
        ]),
      );
    });

    group('copyWith', () {
      test('returns the same object if no arguments are provided', () {
        final original = appSettingsFixture;
        expect(original.copyWith(), equals(original));
      });

      test('replaces non-null values', () {
        final original = appSettingsFixture;
        final newDisplaySettings = original.displaySettings.copyWith(
          accentTheme: AppAccentTheme.newsRed,
        );
        const newLanguage = SupportedLanguage.es;
        final newFeedPreferences = original.feedSettings.copyWith(
          feedItemDensity: FeedItemDensity.compact,
        );

        final copied = original.copyWith(
          displaySettings: newDisplaySettings,
          language: newLanguage,
          feedSettings: newFeedPreferences,
        );

        expect(copied.id, original.id);
        expect(copied.displaySettings, newDisplaySettings);
        expect(copied.language, newLanguage);
        expect(copied.feedSettings, newFeedPreferences);
      });
    });

    group('fromJson/toJson', () {
      test('round trip', () {
        final original = appSettingsFixture;
        final json = original.toJson();
        final reconstructed = AppSettings.fromJson(json);
        expect(reconstructed, equals(original));
      });
    });
  });
}
