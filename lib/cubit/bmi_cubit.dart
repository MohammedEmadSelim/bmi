import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());

  final Dio _dio = Dio();
  final String _apiKey = "ead8cc5e-8320-4ed6-a47a-78b6cb86f82d";

  Future<void> calBMI({
    required double weight,
    required double height,
    required String gender,
  }) async {
    emit(BmiLoading());

    try {
      final response = await _dio.get(
        "https://api.apiverve.com/v1/bmicalculator",
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
        final data = response.data["data"];

        final bmi = data["bmi"].toString();
        final health = data["health"];

        emit(BmiSuccess(
          bmi: bmi,
          health: health,
        ));
      } else {
        emit(BmiFailure("Server Error"));
      }
    } catch (e) {
      emit(BmiFailure(e.toString()));
    }
  }
}
