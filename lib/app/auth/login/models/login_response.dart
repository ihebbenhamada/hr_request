class LoginResponse {
  final String resultMessage;
  final String userName;
  final String email;
  final String phoneNumber;
  final String token;
  final String refreshTokenExpiration;
  final bool isAdmin;
  final bool isAuthenticated;

  LoginResponse({
    required this.resultMessage,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.token,
    required this.refreshTokenExpiration,
    required this.isAdmin,
    required this.isAuthenticated,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      resultMessage: json['resultMessage'],
      userName: json['userName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      token: json['token'],
      refreshTokenExpiration: json['refreshTokenExpiration'],
      isAdmin: json['isAdmin'],
      isAuthenticated: json['isAuthenticated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'resultMessage': resultMessage,
      'userName': userName,
      'email': email,
      'phoneNumber': phoneNumber,
      'token': token,
      'refreshTokenExpiration': refreshTokenExpiration,
      'isAdmin': isAdmin,
      'isAuthenticated': isAuthenticated,
    };
  }
}
