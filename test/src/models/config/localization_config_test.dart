import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('LocalizationConfig', () {
    const localizationConfig = LocalizationConfig(
      enabledLanguages: [SupportedLanguage.en],
      defaultLanguage: SupportedLanguage.en,
    );

    final json = {
      'enabledLanguages': ['en'],
      'defaultLanguage': 'en',
    };

    test('supports value equality', () {
      expect(
        localizationConfig,
        equals(
          const LocalizationConfig(
            enabledLanguages: [SupportedLanguage.en],
            defaultLanguage: SupportedLanguage.en,
          ),
        ),
      );
    });

    test('props are correct', () {
      expect(
        localizationConfig.props,
        equals([
          localizationConfig.enabledLanguages,
          localizationConfig.defaultLanguage,
        ]),
      );
    });

    group('fromJson', () {
      test('returns correct LocalizationConfig from valid JSON', () {
        expect(LocalizationConfig.fromJson(json), equals(localizationConfig));
      });
    });

    group('toJson', () {
      test('returns correct JSON from LocalizationConfig', () {
        expect(localizationConfig.toJson(), equals(json));
      });
    });

    group('copyWith', () {
      test('returns a copy with updated values', () {
        final copy = localizationConfig.copyWith(
          supportedLanguages: [SupportedLanguage.en, SupportedLanguage.es],
          defaultLanguage: SupportedLanguage.es,
        );
        expect(
          copy,
          equals(
            const LocalizationConfig(
              enabledLanguages: [SupportedLanguage.en, SupportedLanguage.es],
              defaultLanguage: SupportedLanguage.es,
            ),
          ),
        );
      });

      test('returns the same object if no arguments are provided', () {
        expect(localizationConfig.copyWith(), equals(localizationConfig));
      });
    });
  });
}
