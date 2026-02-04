class BmiModel {
  BmiModel({
    // required this.state,
    // required this.error,
    required this.bmiDate
  });

// final String state ;
// final dynamic error;
final BmiDate bmiDate;

   factory BmiModel.fromJson(Map<String , dynamic> json) => BmiModel(
       // state: json["state"],
       // error: json["error"],
       bmiDate: BmiDate.fromJson(json["data"]),
   );


}


class BmiDate{
  BmiDate({
    required this.height,
    required this.weight,
    required this.risk,
    required this.summary,
    required this.recommendation,
    required this.bmi
  });

  final String height;
  final String weight;
  final String risk;
  final double bmi;
  final String summary;
  final String recommendation;

  factory BmiDate.fromJson(Map<String , dynamic> json) => BmiDate(
    height: json["height"],
    weight: json["weight"],
    bmi: json["bmi"],
    risk: json["risk"],
    summary: json["summary"],
    recommendation: json["recommendation"]

  );

}