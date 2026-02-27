// ignore_for_file: lines_longer_than_80_chars

/// {@template storage_exception}
/// Base class for all key-value storage related exceptions.
/// {@endtemplate}
abstract class StorageException implements Exception {
  /// {@macro storage_exception}
  const StorageException({this.message, this.cause});

  /// Optional original exception that caused this storage exception.
  final Object? cause;

  /// Optional message describing the error.
  final String? message;

  @override
  String toString() {
    var result = runtimeType.toString();
    if (message != null) {
      result += ': $message';
    }
    if (cause != null) {
      result += '\nCaused by: $cause';
    }
    return result;
  }
}

/// {@template storage_initialization_exception}
/// Exception thrown when a storage operation fails during initialization.
/// {@endtemplate}
class StorageInitializationException extends StorageException {
  /// {@macro storage_initialization_exception}
  const StorageInitializationException({super.message, super.cause});
}

/// {@template storage_write_exception}
/// Exception thrown when a write operation fails.
/// {@endtemplate}
class StorageWriteException extends StorageException {
  /// {@macro storage_write_exception}
  const StorageWriteException(
    this.key,
    this.value, {
    super.message = 'Failed to write value for key.',
    super.cause,
  });

  /// The key associated with the failed write operation.
  final String key;

  /// The value that failed to be written.
  final dynamic value;

  @override
  String toString() {
    var result = 'StorageWriteException: $message Key: "$key"';
    if (cause != null) {
      result += '\nCaused by: $cause';
    }
    return result;
  }
}

/// {@template storage_read_exception}
/// Exception thrown when a read operation fails for reasons other than
/// key not found or type mismatch.
/// {@endtemplate}
class StorageReadException extends StorageException {
  /// {@macro storage_read_exception}
  const StorageReadException(
    this.key, {
    super.message = 'Failed to read value for key.',
    super.cause,
  });

  /// The key associated with the failed read operation.
  final String key;

  @override
  String toString() {
    var result = 'StorageReadException: $message Key: "$key"';
    if (cause != null) {
      result += '\nCaused by: $cause';
    }
    return result;
  }
}

/// {@template storage_delete_exception}
/// Exception thrown when a delete operation fails.
/// {@endtemplate}
class StorageDeleteException extends StorageException {
  /// {@macro storage_delete_exception}
  const StorageDeleteException(
    this.key, {
    super.message = 'Failed to delete value for key.',
    super.cause,
  });

  /// The key associated with the failed delete operation.
  final String key;

  @override
  String toString() {
    var result = 'StorageDeleteException: $message Key: "$key"';
    if (cause != null) {
      result += '\nCaused by: $cause';
    }
    return result;
  }
}

/// {@template storage_clear_exception}
/// Exception thrown when the clear operation fails.
/// {@endtemplate}
class StorageClearException extends StorageException {
  /// {@macro storage_clear_exception}
  const StorageClearException({
    super.message = 'Failed to clear storage.',
    super.cause,
  });
}

/// {@template storage_key_not_found_exception}
/// Exception thrown when attempting to read or delete a key that does not exist.
///
/// Note: `read*` methods might return null instead of throwing this,
/// depending on the implementation contract.
/// {@endtemplate}
class StorageKeyNotFoundException extends StorageException {
  /// {@macro storage_key_not_found_exception}
  const StorageKeyNotFoundException(
    this.key, {
    super.message = 'Key not found in storage.',
  }) : super(cause: null);

  /// The key that was not found.
  final String key; // Typically not caused by another exception

  @override
  String toString() {
    return 'StorageKeyNotFoundException: $message Key: "$key"';
  }
}

/// {@template storage_type_mismatch_exception}
/// Exception thrown when the data retrieved from storage does not match
/// the expected type.
/// {@endtemplate}
class StorageTypeMismatchException extends StorageException {
  /// {@macro storage_type_mismatch_exception}
  const StorageTypeMismatchException(
    this.key,
    this.expectedType,
    this.actualType, {
    super.message = 'Type mismatch for key.',
  }) : super(cause: null);

  /// The key associated with the type mismatch.
  final String key;

  /// The type that was expected.
  final Type expectedType;

  /// The actual type found in storage.
  final Type actualType; // Typically not caused by another exception

  @override
  String toString() {
    return 'StorageTypeMismatchException: $message Key: "$key", Expected: $expectedType, Found: $actualType';
  }
}
