import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import '../model/bmi_model.dart';

abstract class BmiState {}

class BmiInitial extends BmiState {}

class BmiLoading extends BmiState {}

class BmiSuccess extends BmiState {
  final BmiModel result;
  BmiSuccess(this.result);
}

class BmiError extends BmiState {
  final String msg;
  BmiError(this.msg);
}

class BmiCubit extends Cubit<BmiState> {
  final Dio _dio = Dio();

  BmiCubit() : super(BmiInitial());

  void calculate(int h, int w, int a, String g) async {
    emit(BmiLoading());
    try {
      final response = await _dio.get(
        "https://api.apiverve.com/v1/bmicalculator",
        queryParameters: {
          'weight': w,
          'height': h,
          'age': a,
          'gender': g,
          'unit': 'metric',
        },
        options: Options(
          headers: {
            'x-api-key': 'd31750ab-6ea8-4baf-a958-fb43c3f460ef',
          },
        ),
      );

      if (response.statusCode == 200) {
        emit(BmiSuccess(BmiModel.fromJson(response.data)));
      } else {
        emit(BmiError("Error: ${response.statusMessage}"));
      }
    } on DioException catch (e) {
      String errorMessage = "Error";
      if (e.response?.statusCode == 429) {
        errorMessage = "Quota exceeded (429)";
      } else if (e.response?.data != null && e.response?.data['error'] != null) {
        errorMessage = e.response?.data['error'];
      } else {
        errorMessage = e.message ?? errorMessage;
      }
      emit(BmiError(errorMessage));
    } catch (e) {
      emit(BmiError(e.toString()));
    }
  }
}