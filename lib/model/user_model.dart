class UserModel {
  String id;
  String username;
  String email;
  String password;
  String phone;
  String birthDate;
  String gender;
  bool isAdmin;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

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
    required this.v,
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
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'username': username,
      'email': email,
      'password': password,
      'Phone': phone,
      'BirthDate': birthDate,
      'Gender': gender,
      'isAdmin': isAdmin,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
