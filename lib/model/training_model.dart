class TrainingModel {
  final String id;
  final String trainingCompany;
  final String email;
  final String phone;
  final String kindOfTrain;
  final String location;
  final DateTime createdAt;
  final DateTime updatedAt;

  TrainingModel({
    required this.id,
    required this.trainingCompany,
    required this.email,
    required this.phone,
    required this.kindOfTrain,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
  });

  factory TrainingModel.fromJson(Map<String, dynamic> json) {
    return TrainingModel(
      id: json['_id'],
      trainingCompany: json['TrainingCompany'],
      email: json['Email'],
      phone: json['Phone'],
      kindOfTrain: json['KindOfTrain'],
      location: json['Location'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
