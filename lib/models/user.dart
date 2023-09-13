class User {
  final String? id;
  final String? email;
  final String? name;
  final String? createdAt;

  User({this.id, this.email, this.name, this.createdAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      createdAt: json['created_at'],
    );
  }
}
