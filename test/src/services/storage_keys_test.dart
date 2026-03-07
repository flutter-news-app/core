// ignore_for_file: lines_longer_than_80_chars

import 'package:core/core.dart';
import 'package:test/test.dart';

void main() {
  group('StorageKey Enum', () {
    test('stringValue getter returns correct values', () {
      // Check the stringValue getter for each enum member
      expect(StorageKey.authToken.stringValue, equals('auth_token'));
      expect(
        StorageKey.hasSeenAppTour.stringValue,
        equals('has_seen_app_tour'),
      );
      expect(StorageKey.fcmToken.stringValue, equals('fcm_token'));
      expect(
        StorageKey.oneSignalPlayerId.stringValue,
        equals('one_signal_player_id'),
      );
    });

    // Test that all enum values are covered in the stringValue getter's switch statement.
    // This helps prevent forgetting to update the getter when adding new keys.
    test('stringValue getter covers all enum values', () {
      for (final key in StorageKey.values) {
        // Expecting the getter not to throw an error is a basic check that
        // the switch statement handles all cases.
        expect(() => key.stringValue, returnsNormally);
      }
    });
  });
}
