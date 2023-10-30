class AuthResponse {
  final String? accessToken;

  AuthResponse({this.accessToken});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: json['accessToken'],
    );
  }
}

