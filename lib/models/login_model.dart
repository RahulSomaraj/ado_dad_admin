class LoginResponse {
  final int id;
  final String token;
  final String refreshToken;
  final String userName;
  final String email;
  final String userType;

  LoginResponse({
    required this.id,
    required this.token,
    required this.refreshToken,
    required this.userName,
    required this.email,
    required this.userType,
  });
}
 