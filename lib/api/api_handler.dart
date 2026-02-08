import 'package:dio/dio.dart';

class ApiHandler {
  final Dio _dio = Dio();

  Future<double?> fetchBmiFromApi({
    required int weight,
    required int height,
  }) async {
    try {
      final response = await _dio.get(
        "https://api.apiverve.com/v1/bmicalculator",
        queryParameters: {
          "weight": weight,
          "height": height,
          "unit": "metric",
        },
        options: Options(
          headers: {
            "x-api-key": "ead8cc5e-8320-4ed6-a47a-78b6cb86f82d",
          },
        ),
      );

      if (response.statusCode == 200) {
        return response.data['data']['bmi'];
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}