import 'package:dio/dio.dart';
import 'package:bmi/service/end_point.dart';

class BmiService {
  final Dio _dio = Dio();
  final String _apiKey = "ead8cc5e-8320-4ed6-a47a-78b6cb86f82d";

  Future<Map<String, dynamic>?> fetchBmiData({
    required double weight,
    required double height,
    required String gender,
  }) async {
    try {
      var response = await _dio.get(
        ApiEndpoints.baseUrl,
        queryParameters: {
          "weight": weight,
          "height": height,
          "unit": "metric",
          "gender": gender,
        },
        options: Options(
          headers: {"x-api-key": _apiKey},
        ),
      );

      if (response.statusCode == 200) {
        return response.data;
      }
    } catch (e) {
      print("Error in Service: $e");
    }
    return null;
  }
}