class PeopeleModel {
  final String name;
  final String email;

  PeopeleModel({required this.name, required this.email});

  factory PeopeleModel.fromJson(Map<String, dynamic> json) {
    return PeopeleModel(
      name: json['name'],
      email: json['email'],
    );
  }
}
