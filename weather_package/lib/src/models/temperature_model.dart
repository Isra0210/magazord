class TemperatureModel {
  final double day;
  final double min;
  final double max;
  final double night;
  final double eve;
  final double morn;

  TemperatureModel({
    required this.day,
    required this.min,
    required this.max,
    required this.night,
    required this.eve,
    required this.morn,
  });

  factory TemperatureModel.fromJson(Map<String, dynamic> json) {
    return TemperatureModel(
      day: json['day'],
      min: (json['min']).toDouble(),
      max: (json['max']).toDouble(),
      night: (json['night']).toDouble(),
      eve: (json['eve']).toDouble(),
      morn: json['morn'],
    );
  }
}
