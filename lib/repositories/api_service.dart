import 'package:dio/dio.dart';
import 'package:ado_dad_admin/common/data_storage.dart';

class ApiService {
  static final ApiService _instance = ApiService._internal();
  late Dio _dio;

  factory ApiService() {
    return _instance;
  }

  ApiService._internal() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://uat.ado-dad.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 15),
    ));

    _initializeInterceptors(); // Ensure interceptors are added immediately
  }

  /// Get the Dio instance for API calls
  Dio get dio {
    return _dio;
  }

  /// Initialize Dio interceptors
  void _initializeInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await getToken();
          if (token != null) {
            options.headers['Authorization'] = token;
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401) {
            final newToken = await _refreshToken();
            if (newToken != null) {
              e.requestOptions.headers['Authorization'] = newToken;
              final retryResponse = await _dio.fetch(e.requestOptions);
              return handler.resolve(retryResponse);
            } else {
              await logout();
            }
          }
          return handler.next(e);
        },
      ),
    );
  }

  Future<String?> _refreshToken() async {
    try {
      final refreshToken = await getRefreshToken();
      if (refreshToken == null) {
        return null;
      }

      final response = await _dio.post('/auth/refresh', data: {
        'refreshToken': refreshToken,
      });

      if (response.statusCode == 200) {
        final newAccessToken = response.data['token'];
        await SharedPrefs().setString('token', newAccessToken);

        return newAccessToken;
      } else {
        await logout();
        return null;
      }
    } catch (e) {
      await logout();
      return null;
    }
  }

  Future<void> logout() async {
    await clearUserData();
  }
}

class DioErrorHandler {
  static String handleError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return "❌ Connection timeout. Please check your internet.";
      case DioExceptionType.receiveTimeout:
        return "❌ Receive timeout. Server is too slow.";
      case DioExceptionType.sendTimeout:
        return "❌ Send timeout. Please try again.";
      case DioExceptionType.badResponse:
        return _handleBadResponse(e.response);
      case DioExceptionType.cancel:
        return "❌ Request was cancelled.";
      case DioExceptionType.connectionError:
        return "❌ No internet connection. Check your network.";
      case DioExceptionType.unknown:
      default:
        return "❌ Unexpected error: ${e.message}";
    }
  }

  static String _handleBadResponse(Response? response) {
    if (response == null) return "❌ No response from server.";

    switch (response.statusCode) {
      case 400:
        return "❌ Bad request. Please try again.";
      case 401:
        return "❌ Unauthorized. Please log in again.";
      case 403:
        return "❌ Forbidden. You don't have permission.";
      case 404:
        return "❌ Not found. The requested resource doesn't exist.";
      case 500:
        return "❌ Internal server error. Try again later.";
      default:
        return "❌ Error ${response.statusCode}: ${response.statusMessage}";
    }
  }
}
