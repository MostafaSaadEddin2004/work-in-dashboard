class JobModel {
  final String id;
  final String companyName;
  final String email;
  final String phone;
  final String jobTitle;
  final String experiencesForJob;
  final String workTime;
  final String companyNav;
  final String gender;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  JobModel(
      {required this.id,
      required this.companyName,
      required this.email,
      required this.phone,
      required this.jobTitle,
      required this.experiencesForJob,
      required this.workTime,
      required this.companyNav,
      required this.gender,
      required this.createdAt,
      required this.updatedAt,
      required this.version});

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
      id: json['_id'] as String,
      companyName: json['CompanyName'] as String,
      email: json['Email'] as String,
      phone: json['Phone'] as String,
      jobTitle: json['JobTitle'] as String,
      experiencesForJob: json['ExperiencesForJob'] as String,
      workTime: json['WorkTime'] as String,
      companyNav: json['CompanyNav'] as String,
      gender: json['Gender'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      version: json['__v'] as int,
    );
  }
}
