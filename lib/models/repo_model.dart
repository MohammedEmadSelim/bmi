import 'package:dio/dio.dart';

class AppRepo{
  Future<Map<String , dynamic>> calcBmi(String weight , String height ) async{
        var dio = Dio();
        try{
          print("Start api call");
          var result = await dio.get(
              "https://api.apiverve.com/v1/bmicalculator",
              queryParameters: {"weight": 70, "height": 120, "unit": "metric"},
              options: Options(
                headers: {"x-api-key": "ead8cc5e-8320-4ed6-a47a-78b6cb86f82d"},

              ),
          );
          print("result of call${result.data}");
           return result.data;
        }
        catch(e){
          throw (e) ;
        }
  }
}