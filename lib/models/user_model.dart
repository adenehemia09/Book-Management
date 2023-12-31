class User {
  final String name;
  final String email;
  final String password;
  final DateTime emailVerifiedAt;
  final DateTime updatedAt;
  final DateTime createdAt;
  final int id;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.emailVerifiedAt,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  factory User.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return User.empty();
    }

    return User(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      emailVerifiedAt: DateTime.parse(json['email_verified_at'] ?? ''),
      updatedAt: DateTime.parse(json['updated_at'] ?? ''),
      createdAt: DateTime.parse(json['created_at'] ?? ''),
      id: json['id'] ?? 0,
    );
  }

  factory User.empty() {
    return User(
      name: '',
      email: '',
      password: '',
      emailVerifiedAt: DateTime.now(),
      updatedAt: DateTime.now(),
      createdAt: DateTime.now(),
      id: 0,
    );
  }
}
