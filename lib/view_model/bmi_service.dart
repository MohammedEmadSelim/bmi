import 'package:bmi/models/bmi_model.dart';
import'package:dio/dio.dart';

class BmiService {
  Future<BmiModel> getBmiData(double height,double weight)async{
   final Dio dio = Dio();

    final response = await dio.get(
        'https://api.apiverve.com/v1/bmicalculator',
        queryParameters: {
          'height':height,
          'weight':weight,
        },
        options: Options(
            headers: {
              'x-api-key':'1e229c20-312e-404e-8e11-e057deedc3ee',
            }
        )
    );

    return BmiModel.fromJson(response.data);
  }
}
