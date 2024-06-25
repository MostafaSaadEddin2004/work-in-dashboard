class JobModel {
  final String id;
  final String companyName;
  final String jobTitle;
  final String experiencesForJob;
  final String workTime;
  final String companyNav;
  final String gender;

  JobModel({
    required this.id,
    required this.companyName,
    required this.jobTitle,
    required this.experiencesForJob,
    required this.workTime,
    required this.companyNav,
    required this.gender,
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
    );
  }
}