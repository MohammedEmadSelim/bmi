import 'package:dio/dio.dart';
import 'package:bmi/calculation_model.dart';

class ApiService {
  static const String _baseUrl =
      'https://api.apiverve.com/v1/bmicalculator';
  static const String _apiKey = 'df73e325-c60e-4790-8c14-278d873e745e';

  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      headers: {
        'x-api-key': _apiKey,
      },
    ),
  );

  static Future<BmiResponse> calculateBmi({
    required double weight,
    required double height,
  }) async {
    final response = await _dio.get(
      '',
      queryParameters: {
        'weight': weight,
        'height': height,
        'unit': 'metric',
      },
    );
    return BmiResponse.fromJson(response.data);
  }
}
