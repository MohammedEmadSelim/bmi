import 'package:dio/dio.dart';
import 'package:bmi/model/bmi_model.dart';
import 'package:dio/dio.dart';


class BmiRepository {
  final Dio _dio = Dio();

  Future<BmiModel> fetchBmi(int h, int w, int a, String g) async {
    final response = await _dio.get(
      "https://api.apiverve.com/v1/bmicalculator",
      queryParameters: {'height': h, 'weight': w, 'age': a, 'gender': g},
      options: Options(headers: {'x-api-key': "ead8cc5e-8320-4ed6-a47a-78b6cb86f82d"}),
    );
    return BmiModel.fromJson(response.data);
  }
}