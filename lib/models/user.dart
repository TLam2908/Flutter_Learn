class User {
  final int id;
  final String name;
  final String email;
  final String? password;

  const User({required this.id, required this.name, required this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}