import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;
  // Uncomment the line below if FlutterSecureStorage is required
  // final FlutterSecureStorage _storage = const FlutterSecureStorage();

  DioClient()
      : dio = Dio(
          BaseOptions(
            baseUrl: 'http://localhost:5000/',
            connectTimeout: const Duration(seconds: 10),
            receiveTimeout: const Duration(seconds: 15),
            contentType: 'application/json',
          ),
        ) {
    // Add interceptors
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Uncomment this section if you need to retrieve and use tokens
          // String? token = await _storage.read(key: 'accessToken');
          // options.headers['Authorization'] = 'Bearer $token';

          print('Request [${options.method}] => PATH: ${options.uri}');
          return handler.next(options); // Continue with the request
        },
        onResponse: (response, handler) {
          // Log successful responses
          print('Response [${response.statusCode}] => DATA: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          print('DioException: ${e.response?.statusCode}');

          // Handle token expiration (401)
          if (e.response?.statusCode == 401) {
            print('Token expired - refreshing token...');

            final refreshed = await _refreshToken();
            if (refreshed) {
              final options = e.requestOptions;

              // Uncomment this section if token refresh logic is implemented
              // String? newToken = await _storage.read(key: 'accessToken');
              // options.headers['Authorization'] = 'Bearer $newToken';

              return handler.resolve(await dio.request(
                options.path,
                options: Options(
                  method: options.method,
                  headers: options.headers,
                ),
                data: options.data,
                queryParameters: options.queryParameters,
              ));
            }
          }
          return handler.next(e); // Continue with the error if refresh fails
        },
      ),
    );
  }

  // Refresh token logic
  Future<bool> _refreshToken() async {
    try {
      // Uncomment and implement token refresh logic
      // String? refreshToken = await _storage.read(key: 'refreshToken');
      // final response = await dio.post(
      //   '/auth/refresh',
      //   data: {'refreshToken': refreshToken},
      // );

      // if (response.statusCode == 200) {
      //   await _storage.write(key: 'accessToken', value: response.data['accessToken']);
      //   await _storage.write(key: 'refreshToken', value: response.data['refreshToken']);
      print('Token refreshed successfully');
      return true;
      // } else {
      //   throw Exception('Failed to refresh token.');
      // }
    } catch (e) {
      print('Refresh Token Error: $e');
      await _logout();
      return false;
    }
  }

  // Logout logic to clear tokens
  Future<void> _logout() async {
    // Uncomment to clear tokens
    // await _storage.delete(key: 'accessToken');
    // await _storage.delete(key: 'refreshToken');
    print('User logged out - tokens cleared');
  }

  // HTTP Methods
  Future<Response> get(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.get(endpoint, queryParameters: queryParameters);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    try {
      return await dio.post(endpoint, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
    String endpoint,
    Map<String, dynamic> data,
  ) async {
    try {
      return await dio.put(endpoint, data: data);
    } catch (e) {
      print("e");
      print(e);
      rethrow;
    }
  }

  Future<Response> patch(
    String endpoint, {
    required Map<String, dynamic> data,
  }) async {
    try {
      return await dio.patch(endpoint, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      return await dio.delete(endpoint, queryParameters: queryParameters);
    } catch (e) {
      rethrow;
    }
  }
}
