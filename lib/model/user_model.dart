class UserModel {
  final String id;
  final String username;
  final String email;
  final String password; // Consider hashing before storing in production
  final String phone;
  final DateTime birthDate;
  final String gender;
  final bool isAdmin;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;
  final String profileImage;
  final bool block;

  // List of favorites with nested item information
  final List<FavoriteItem> favorite;

  // Empty list for followed companies (can be filled later)
  final List<String> followedCompanies;

  final String role;

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
    required this.profileImage,
    required this.block,
    required this.favorite,
    required this.followedCompanies,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      phone: json['Phone'] as String,
      birthDate: DateTime.parse(json['BirthDate'] as String),
      gender: json['Gender'] as String,
      isAdmin: json['isAdmin'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: json['__v'] as int,
      profileImage: json['ProfileImage'] as String,
      block: json['block'] as bool,
      favorite: (json['favorite'] as List)
          .map((item) => FavoriteItem.fromJson(item))
          .toList(),
      followedCompanies: (json['followedCompanies'] as List)
          .map((item) => item as String)
          .toList(),
      role: json['role'] as String,
    );
  }
}

class FavoriteItem {
  final String item;
  final String itemType;
  final String id;

  FavoriteItem({
    required this.item,
    required this.itemType,
    required this.id,
  });

  factory FavoriteItem.fromJson(Map<String, dynamic> json) {
    return FavoriteItem(
      item: json['item'] as String,
      itemType: json['itemType'] as String,
      id: json['_id'] as String,
    );
  }
}
