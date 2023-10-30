class User {
  final String? id;
  final String? email;
  final String? name;
  final String? phone;
  final String? createdAt;
  final String? updatedAt;

  User({this.id, this.email, this.name, this.phone, this.createdAt, this.updatedAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}
