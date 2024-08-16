class CompanyModel {
  final bool isAdmin;
  final bool isAccepted;
  final String id;
  final String companyName;
  final String email;
  final String phone;
  final String companyField;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v; 
  final bool block;

  CompanyModel({
    required this.isAdmin,
    required this.isAccepted,
    required this.id,
    required this.companyName,
    required this.email,
    required this.phone,
    required this.companyField,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.block,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        isAdmin: json['isAdmin'] as bool,
        isAccepted: json['isAccepted'] as bool,
        id: json['_id'] as String,
        companyName: json['companyname'] as String,
        email: json['email'] as String,
        phone: json['Phone'] as String,
        companyField: json['Companyfield'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int,
        block: json['block'] as bool,
      );
}
