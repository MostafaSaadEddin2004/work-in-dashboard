class TrainingModel {
  final String id;
  final String trainingCompany;
  final String kindOfTrain;
  final String location;

  TrainingModel({
    required this.id,
    required this.trainingCompany,
    required this.kindOfTrain,
    required this.location,
  });

  factory TrainingModel.fromJson(Map<String, dynamic> json) {
    return TrainingModel(
      id: json['_id'],
      trainingCompany: json['TrainingCompany'],
      kindOfTrain: json['KindOfTrain'],
      location: json['Location'],
    );
  }
}