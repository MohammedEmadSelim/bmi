class BmiModel {
  final String height;
  final String weight;
  final double bmi;
  final String risk;
  final String summary;
  final String recommendation;

  BmiModel({
    required this.height,
    required this.weight,
    required this.bmi,
    required this.risk,
    required this.summary,
    required this.recommendation});

  factory BmiModel.fromJson(Map<String,dynamic>json){
    final data = json['data'];
    return BmiModel(
        height: data['height'],
        weight: data['weight'],
        bmi: data['bmi'],
        risk: data['risk'],
        summary: data['summary'],
        recommendation: data['recommendation']
    );
  }
}