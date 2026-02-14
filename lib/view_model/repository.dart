import 'package:dio/dio.dart';
class MainAppRepo {
  Future< Map<String,dynamic>> calcBmi(String weight, String height) async {
    var dio = Dio();
    try {
      var res = await dio.get(
        "https://api.apiverve.com/v1/bmicalculator",
        queryParameters: {"weight": 70, "height": 120, "unit": "metric"},
        options: Options(
          headers: {"x-api-key": "ead8cc5e-8320-4ed6-a47a-78b6cb86f82d"},
        ),
      );
      return res.data;
    } catch (e) {
      throw e;
    }
  }
}
