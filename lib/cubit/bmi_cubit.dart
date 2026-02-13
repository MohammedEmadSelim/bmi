import 'package:bmi/calculation_model.dart';
import 'package:bmi/cubit/bmi_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());

  final Dio _dio = Dio();

  Future<void> calBMI({required double weight, required double height}) async {
    emit(BmiLoading());

    try {
      final response = await _dio.get(
        "https://api.apiverve.com/v1/bmicalculator",
        queryParameters: {"weight": weight, "height": height, "unit": "metric"},
        options: Options(
          headers: {"Authorization": "bearer ead8cc5e-8320-4ed6-a47a-78b6cb86f82d"},
        ),
      );

      final bmiResponse = BmiResponse.fromJson(response.data);
      emit(BmiSuccess(bmiData: bmiResponse.data));
    } catch (e) {
      emit(BmiFailure(message: e.toString()));
    }
  }
}
