import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('CallToActionItem', () {
    const mockCallToAction = CallToActionItem(
      id: 'cta-1',
      decoratorType: FeedDecoratorType.linkAccount,
      title: {SupportedLanguage.en: 'Link Account'},
      description: {
        SupportedLanguage.en: 'Link your account to save your progress.',
      },
      callToActionText: {SupportedLanguage.en: 'Link Account'},
      callToActionUrl: 'https://example.com/link-account',
    );

    test('supports value equality', () {
      const item1 = CallToActionItem(
        id: 'cta-1',
        decoratorType: FeedDecoratorType.linkAccount,
        title: {SupportedLanguage.en: 'Link Account'},
        description: {
          SupportedLanguage.en: 'Link your account to save your progress.',
        },
        callToActionText: {SupportedLanguage.en: 'Link Account'},
        callToActionUrl: 'https://example.com/link-account',
      );
      expect(item1, equals(mockCallToAction));
    });

    test('props are correct', () {
      expect(mockCallToAction.props, [
        mockCallToAction.id,
        mockCallToAction.decoratorType,
        mockCallToAction.title,
        mockCallToAction.description,
        mockCallToAction.callToActionText,
        mockCallToAction.callToActionUrl,
        mockCallToAction.type,
      ]);
    });

    group('JSON serialization', () {
      test('works correctly', () {
        final json = mockCallToAction.toJson();
        final fromJson = CallToActionItem.fromJson(json);
        expect(fromJson, equals(mockCallToAction));
      });
    });
  });
}
