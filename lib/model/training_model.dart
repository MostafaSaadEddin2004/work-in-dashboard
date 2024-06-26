class TrainingModel {
  final String id;
  final String trainingCompany;
  final String kindOfTrain;
  final String location;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  TrainingModel({
    required this.id,
    required this.trainingCompany,
    required this.kindOfTrain,
    required this.location,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory TrainingModel.fromJson(Map<String, dynamic> json) {
    return TrainingModel(
      id: json['_id'],
      trainingCompany: json['TrainingCompany'],
      kindOfTrain: json['KindOfTrain'],
      location: json['Location'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }
}