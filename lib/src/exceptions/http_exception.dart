/// Base class for a standardized set of exceptions used across *all* data
/// client implementations (e.g., HTTP, In-Memory, Database)
///
/// The primary goal is to provide a consistent error handling contract for
/// higher layers like Repositories, BLoCs, or API Route Handlers, regardless
/// of the underlying data source.
///
/// Client implementations should catch their specific internal errors (like
/// network issues, database constraint violations, item not found in a local
/// cache, etc.) and map them to the most semantically appropriate subclass
/// of [HttpException].
///
/// The [message] field is crucial and should be used to provide specific
/// context about the error's origin and details.
///
/// **Example Usage:**
/// - An HTTP client receiving a 404 status might throw:
///   `NotFoundException("API Error: Resource with ID 'xyz' not found.")`
/// - An In-Memory client failing to find an item might throw:
///   `NotFoundException("In-Memory Error: Item with ID 'abc' not found.")`
/// - A client failing to parse data might throw:
///   `UnknownException("Data Parsing Error: Could not parse the received data.")`
/// - An HTTP client encountering a server error (5xx) might throw:
///   `ServerException("API Error: The server encountered an internal error.")`
class HttpException implements Exception {
  /// {@macro ht_http_exception}
  const HttpException(this.message);

  /// The error message providing specific context about the failure.
  final String message;

  @override
  String toString() => '$runtimeType: $message'; // Use runtimeType for clarity
}
