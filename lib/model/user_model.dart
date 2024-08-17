class UserModel {
  final String id;
  final String username;
  final String email;
  final String phone;
  final String gender;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String role;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      phone: json['Phone'],
      gender: json['Gender'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      role: json['role'] ,
    );
  }
}