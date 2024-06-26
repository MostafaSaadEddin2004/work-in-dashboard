class UserModel {
  final String id;
  final String username;
  final String email;
  final String password;
  final String phone;
  final String birthDate;
  final String gender;
  final bool isAdmin;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.birthDate,
    required this.gender,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      phone: json['Phone'],
      birthDate: json['BirthDate'],
      gender: json['Gender'],
      isAdmin: json['isAdmin'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }
}