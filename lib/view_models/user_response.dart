class UserResponse {
  final String? id;
  final String? email;
  final String? name;
  final String? createdAt;

  UserResponse({this.id, this.email, this.name, this.createdAt});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      createdAt: json['createdAt'],
    );
  }
}
