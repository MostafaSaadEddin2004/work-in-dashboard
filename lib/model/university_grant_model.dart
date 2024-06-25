class UniversityGrantModel {
  final String id;
  final String universityName;
  final String grantType;
  final String bachelorsKind;
  final String location;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  UniversityGrantModel({
    required this.id,
    required this.universityName,
    required this.grantType,
    required this.bachelorsKind,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory UniversityGrantModel.fromJson(Map<String, dynamic> json) {
    return UniversityGrantModel(
      id: json['_id'],
      universityName: json['UniversityName'],
      grantType: json['GrantType'],
      bachelorsKind: json['Bachelorskind'],
      location: json['Location'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }
}