import 'package:core/src/enums/ad_platform_type.dart';
import 'package:test/test.dart';

void main() {
  group('AdPlatformType', () {
    test('has correct string values', () {
      expect(AdPlatformType.admob.name, 'admob');
      expect(AdPlatformType.appLovin.name, 'appLovin');
    });

    test('can be created from string values', () {
      expect(AdPlatformType.values.byName('admob'), AdPlatformType.admob);
      expect(AdPlatformType.values.byName('appLovin'), AdPlatformType.appLovin);
    });

    test('has correct toString representation', () {
      expect(AdPlatformType.admob.toString(), 'AdPlatformType.admob');
      expect(AdPlatformType.appLovin.toString(), 'AdPlatformType.appLovin');
    });
  });
}
