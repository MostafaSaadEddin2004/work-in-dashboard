class CompanyRequestModel {
  final String id;

  CompanyRequestModel({required this.id});

  factory CompanyRequestModel.fromJson(Map<String, dynamic> json) {
    return CompanyRequestModel(id: json['id']);
  }
}
