// ignore_for_file: only_throw_errors

import 'package:core/core.dart';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

/// {@template http_client}
/// A robust HTTP client built on top of Dio, providing simplified API calls,
/// automatic authentication header injection, and custom exception mapping.
///
/// This client handles common HTTP methods (GET, POST, PUT, DELETE) and maps
/// Dio errors and non-2xx status codes to specific [HttpException] subtypes
/// defined in `exceptions.dart`.
/// {@endtemplate}
class HttpClient {
  /// {@macro http_client}
  ///
  /// Creates an instance of [HttpClient].
  ///
  /// Requires a "baseUrl" for the API endpoint and a [tokenProvider] function
  /// to asynchronously retrieve the authentication token.
  ///
  /// Optionally accepts a:
  /// - pre-configured [dioInstance] for advanced customization
  ///   or testing
  /// - list of additional [interceptors] to be added alongside
  ///   the default Auth and Error interceptors.
  /// - [logger]: Optional [Logger] instance for logging HTTP requests and responses.
  HttpClient({
    required String baseUrl,
    required TokenProvider tokenProvider,
    Dio? dioInstance,
    BaseOptions? options,
    List<Interceptor>? interceptors,
    Logger? logger,
  }) : _dio = dioInstance ?? Dio(),
       _logger = logger ?? Logger('HttpClient') {
    // Configure base options
    _dio.options = options ?? _dio.options;
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout ??= const Duration(seconds: 30);
    _dio.options.receiveTimeout ??= const Duration(seconds: 30);
    _dio.options.sendTimeout ??= const Duration(seconds: 30);

    // Set the appropriate HttpClientAdapter
    _dio.httpClientAdapter = createAdapter();

    // Add default interceptors
    _dio.interceptors.addAll([
      AuthInterceptor(tokenProvider: tokenProvider),
      ErrorInterceptor(),
      // Add any custom interceptors provided
      ...?interceptors,
    ]);

    // Optionally add logging interceptor for debugging
    // _dio.interceptors.add(
    //  LogInterceptor(requestBody: true, responseBody: true)
    // );
  }

  /// The configured Dio instance used for making requests.
  final Dio _dio;

  /// The logger instance for this HTTP client.
  final Logger _logger;

  /// Performs a GET request.
  ///
  /// - [path]: The endpoint path appended to the "baseUrl".
  /// - [queryParameters]: Optional map of query parameters.
  /// - [options]: Optional [Options] to override Dio defaults for this request.
  /// - [cancelToken]: Optional [CancelToken] for request cancellation.
  ///
  /// Returns the response data decoded as type [T].
  /// Throws an [HttpException] on network errors or non-2xx status codes.
  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    _logger
      ..info('GET $path')
      ..fine('Query: $queryParameters');
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      _logger.info('GET $path [${response.statusCode}]');
      // Dio automatically throws for non-2xx, ErrorInterceptor maps it
      return response.data as T;
    } on DioException catch (e) {
      if (e.error is HttpException) {
        _logger.severe('GET $path failed: ${e.error}');
        throw e.error!;
      }
      _logger.severe('GET $path failed (Dio): ${e.message}');
      rethrow;
    }
  }

  /// Performs a POST request.
  ///
  /// - [path]: The endpoint path appended to the "baseUrl".
  /// - [data]: Optional request body data.
  /// - [queryParameters]: Optional map of query parameters.
  /// - [options]: Optional [Options] to override Dio defaults for this request.
  /// - [cancelToken]: Optional [CancelToken] for request cancellation.
  ///
  /// Returns the response data decoded as type [T].
  /// Throws an [HttpException] on network errors or non-2xx status codes.
  Future<T> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    _logger
      ..info('POST $path')
      ..fine('Query: $queryParameters, Data: ${_summarize(data)}');
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      _logger.info('POST $path [${response.statusCode}]');
      return response.data as T;
    } on DioException catch (e) {
      if (e.error is HttpException) {
        _logger.severe('POST $path failed: ${e.error}');
        throw e.error!;
      }
      _logger.severe('POST $path failed (Dio): ${e.message}');
      rethrow;
    }
  }

  /// Performs a PUT request.
  ///
  /// - [path]: The endpoint path appended to the "baseUrl".
  /// - [data]: Optional request body data.
  /// - [queryParameters]: Optional map of query parameters.
  /// - [options]: Optional [Options] to override Dio defaults for this request.
  /// - [cancelToken]: Optional [CancelToken] for request cancellation.
  ///
  /// Returns the response data decoded as type [T].
  /// Throws an [HttpException] on network errors or non-2xx status codes.
  Future<T> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    _logger
      ..info('PUT $path')
      ..fine('Query: $queryParameters, Data: ${_summarize(data)}');
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      _logger.info('PUT $path [${response.statusCode}]');
      return response.data as T;
    } on DioException catch (e) {
      if (e.error is HttpException) {
        _logger.severe('PUT $path failed: ${e.error}');
        throw e.error!;
      }
      _logger.severe('PUT $path failed (Dio): ${e.message}');
      rethrow;
    }
  }

  /// Performs a DELETE request.
  ///
  /// - [path]: The endpoint path appended to the "baseUrl".
  /// - [data]: Optional request body data (less common for DELETE).
  /// - [queryParameters]: Optional map of query parameters.
  /// - [options]: Optional [Options] to override Dio defaults for this request.
  /// - [cancelToken]: Optional [CancelToken] for request cancellation.
  ///
  /// Returns the response data decoded as type [T].
  /// Throws an [HttpException] on network errors or non-2xx status codes.
  Future<T> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    _logger
      ..info('DELETE $path')
      ..fine('Query: $queryParameters');
    try {
      final response = await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      _logger.info('DELETE $path [${response.statusCode}]');
      return response.data as T;
    } on DioException catch (e) {
      if (e.error is HttpException) {
        _logger.severe('DELETE $path failed: ${e.error}');
        throw e.error!;
      }
      _logger.severe('DELETE $path failed (Dio): ${e.message}');
      rethrow;
    }
  }

  String _summarize(dynamic data) {
    if (data == null) return 'null';
    final str = data.toString();
    if (str.length > 200) {
      return '${str.substring(0, 200)}... (truncated)';
    }
    return str;
  }
}
