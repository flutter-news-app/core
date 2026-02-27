import 'package:core/src/exceptions/storage_exceptions.dart';

/// {@template key_value_storage_service}
/// Defines the contract for a generic key-value storage service.
///
/// This abstract class provides a common interface for various
/// key-value storage implementations (e.g., SharedPreferences, Hive,
/// secure storage). It allows for storing and retrieving basic data types
/// associated with string keys.
/// {@endtemplate}
abstract class KVStorageService {
  /// Writes a string value associated with the given [key].
  ///
  /// Throws a [StorageWriteException] if the write operation fails.
  Future<void> writeString({required String key, required String value});

  /// Reads the string value associated with the given [key].
  ///
  /// Returns `null` if the key is not found.
  /// Throws a [StorageReadException] if the read operation fails for other reasons.
  /// Throws a [StorageTypeMismatchException] if the stored value is not a string.
  Future<String?> readString({required String key});

  /// Writes a boolean value associated with the given [key].
  ///
  /// Throws a [StorageWriteException] if the write operation fails.
  Future<void> writeBool({required String key, required bool value});

  /// Reads the boolean value associated with the given [key].
  ///
  /// Returns [defaultValue] (defaulting to `false`) if the key is not found.
  /// Throws a [StorageReadException] if the read operation fails for other reasons.
  /// Throws a [StorageTypeMismatchException] if the stored value is not a boolean.
  Future<bool> readBool({required String key, bool defaultValue = false});

  /// Writes an integer value associated with the given [key].
  ///
  /// Throws a [StorageWriteException] if the write operation fails.
  Future<void> writeInt({required String key, required int value});

  /// Reads the integer value associated with the given [key].
  ///
  /// Returns `null` if the key is not found.
  /// Throws a [StorageReadException] if the read operation fails for other reasons.
  /// Throws a [StorageTypeMismatchException] if the stored value is not an integer.
  Future<int?> readInt({required String key});

  /// Writes a double value associated with the given [key].
  ///
  /// Throws a [StorageWriteException] if the write operation fails.
  Future<void> writeDouble({required String key, required double value});

  /// Reads the double value associated with the given [key].
  ///
  /// Returns `null` if the key is not found.
  /// Throws a [StorageReadException] if the read operation fails for other reasons.
  /// Throws a [StorageTypeMismatchException] if the stored value is not a double.
  Future<double?> readDouble({required String key});

  /// Deletes the value associated with the given [key].
  ///
  /// If the key does not exist, this operation should ideally complete without
  /// throwing an error, but implementations might throw [StorageKeyNotFoundException].
  /// Throws a [StorageDeleteException] if the delete operation fails for other reasons.
  Future<void> delete({required String key});

  /// Deletes all key-value pairs from the storage.
  ///
  /// Use with caution, as this operation is irreversible.
  /// Throws a [StorageClearException] if the clear operation fails.
  Future<void> clearAll();
}

/// {@template storage_key}
/// Defines enum members representing keys used for accessing values
/// stored within the [KVStorageService].
///
/// This enum prevents the use of magic strings for keys, promoting
/// type safety and reducing potential runtime errors. Use the [stringValue]
/// getter to access the underlying string representation for storage.
/// {@endtemplate}
enum StorageKey {
  /// Key for storing the authentication token needed for interraction with
  /// the backend API.
  authToken,

  /// Key for storing a boolean flag indicating whether the user has seen the
  /// Pre-Auth "App Tour/showcase".
  hasSeenAppTour,

  /// Key for storing the Firebase Cloud Messaging (FCM) token for push notifications.
  fcmToken,

  /// Key for storing the OneSignal Player ID for push notifications.
  oneSignalPlayerId;

  /// Returns the snake_case string representation of the key for storage.
  String get stringValue {
    switch (this) {
      case StorageKey.authToken:
        return 'auth_token';
      case StorageKey.hasSeenAppTour:
        return 'has_seen_app_tour';
      case StorageKey.fcmToken:
        return 'fcm_token';
      case StorageKey.oneSignalPlayerId:
        return 'one_signal_player_id';
    }
  }
}
