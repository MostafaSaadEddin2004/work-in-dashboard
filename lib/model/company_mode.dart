class CompanyModel {
  final int id;
  CompanyModel({required this.id});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(id: json['id']);
  }
}
