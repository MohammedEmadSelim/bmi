import 'package:dio/dio.dart';

class MainAppRepo {
  Future<Map<String, dynamic>> calcBmi({
    required double weight,
    required double height,
  }) async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://api.apiverve.com/v1/bmicalculator',
        queryParameters: {'weight': weight, 'height': height, 'unit': 'metric'},
        options: Options(
          headers: {'x-api-key': '87bdc385-ed9e-4aba-a909-c18191ae534b'},
        ),
      );

      print('Status Code: ${response.statusCode}');
      print('Response Data: ${response.data}');

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      print('Dio Error: ${e.message}');
      print('Status: ${e.response?.statusCode}');
      print('Server Response: ${e.response?.data}');
      rethrow;
    }
  }
}
