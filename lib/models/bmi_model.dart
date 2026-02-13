class BmiModel {
  final String status;
  final dynamic error;
  final BmiData bmiData;

  BmiModel({required this.status, required this.error, required this.bmiData});

  factory BmiModel.fromJson(Map<String, dynamic> json) => BmiModel(
    status: json["status"],
    error: json["error"],
    bmiData: BmiData.fromJson(json["data"]),
  );
}

class BmiData {
  final String height;
  final String weight;
  final double bmi;
  final String risk;
  final String summary;
  final String recommendation;

  BmiData({
    required this.height,
    required this.weight,
    required this.bmi,
    required this.risk,
    required this.summary,
    required this.recommendation,
  });
  factory BmiData.fromJson(Map<String, dynamic> json) {
    return BmiData(
      height: json['height'],
      weight: json['weight'],
      bmi: (json['bmi'] as num).toDouble(),
      risk: json['risk'],
      summary: json['summary'],
      recommendation: json['recommendation'],
    );
  }
}