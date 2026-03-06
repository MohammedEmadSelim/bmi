class BmiModel {
  final double bmi;
  final String label;

  BmiModel({required this.bmi, required this.label});

  factory BmiModel.fromJson(Map<String, dynamic> json) {
    return BmiModel(
      bmi: (json['data']?['bmi'] ?? 0.0).toDouble(),
      label: json['data']?['label'] ?? "No Label",
    );
  }
}