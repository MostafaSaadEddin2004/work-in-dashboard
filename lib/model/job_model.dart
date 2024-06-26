class JobModel {
  final String id;
  final String companyName;
  final String jobTitle;
  final String experiencesForJob;
  final String workTime;
  final String companyNav;
  final String gender;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  JobModel({
    required this.id,
    required this.companyName,
    required this.jobTitle,
    required this.experiencesForJob,
    required this.workTime,
    required this.companyNav,
    required this.gender,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['_id'],
      companyName: json['CompanyName'],
      jobTitle: json['JobTitle'],
      experiencesForJob: json['ExperiencesForJob'],
      workTime: json['WorkTime'],
      companyNav: json['CompanyNav'],
      gender: json['Gender'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }
}