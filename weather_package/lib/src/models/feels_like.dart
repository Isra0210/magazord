class FeelsLikeModel {
  final double day;
  final double night;
  final double eve;
  final double morn;

  FeelsLikeModel({
    required this.day,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory FeelsLikeModel.fromJson(Map<String, dynamic> json) {
    return FeelsLikeModel(
      day: json['day'],
      night: (json['night']).toDouble(),
      eve: (json['eve']).toDouble(),
      morn: json['morn'],
    );
  }
}
