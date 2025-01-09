import 'package:ado_dad_admin/core/model/login_model.dart';
import 'package:ado_dad_admin/core/network/user_dio_client.dart';
import 'package:ado_dad_admin/core/model/login_success_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  final DioClient dioClient;

  LoginRepository({required this.dioClient});

  Future<LoginSuccessModel> login(LoginModel login) async {
    try {
      print('Username: ${login.username}');
      print('Password: ${login.password}');

      final response = await dioClient.dio.post(
        'auth/login',
        data: {
          'username': login.username,
          'password': login.password,
        },
      );

      switch (response.statusCode) {
        case 200:
        case 201:
          // Successful login (200 OK or 201 Created)
          print("Login successful");
          final user = LoginSuccessModel.fromJson(response.data);
          print('User: ${user.email}');
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('accessToken', user.token);
          await prefs.setString('refreshToken', user.refreshToken);

          return user;

        case 400:
          // Bad Request - Validation error (Invalid data)
          throw Exception(response.data['error'] ??
              'Invalid input. Please check your data.');

        case 401:
          // Unauthorized - Invalid email/password
          throw Exception(
              response.data['error'] ?? 'Incorrect email or password.');

        case 409:
          // Conflict - User already exists (specific to some APIs)
          throw Exception(response.data['error'] ?? 'User already exists.');

        default:
          throw Exception(
              response.data['error'] ?? 'Unexpected error occurred.');
      }
    } on DioException catch (e) {
      print('DioException: ${e.response?.statusCode}');
      print(e.response?.data);

      if (e.response != null) {
        switch (e.response?.statusCode) {
          case 400:
            throw Exception(e.response?.data['error'] ?? 'Invalid input.');
          case 401:
            throw Exception(e.response?.data['error'] ??
                'Unauthorized. Please check credentials.');
          case 403:
            throw Exception(e.response?.data['error'] ?? 'Access forbidden.');
          case 404:
            throw Exception('Endpoint not found.');
          case 409:
            throw Exception(
                e.response?.data['error'] ?? 'Conflict. User already exists.');
          case 500:
            throw Exception('Server error. Please try again later.');
          default:
            throw Exception(
                e.response?.data['error'] ?? 'Unexpected error occurred.');
        }
      } else {
        throw Exception('Network error. Please check your connection.');
      }
    } catch (e) {
      print('General Exception: $e');
      throw Exception('An unknown error occurred.');
    }
  }
}
