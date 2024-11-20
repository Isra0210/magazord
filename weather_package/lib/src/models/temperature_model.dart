class TemperatureModel {
  final double min;
  final double max;

  TemperatureModel({required this.min, required this.max});

  factory TemperatureModel.fromJson(Map<String, dynamic> json) {
    return TemperatureModel(
      min: (json['min']).toDouble(),
      max: (json['max']).toDouble(),
    );
  }
}
