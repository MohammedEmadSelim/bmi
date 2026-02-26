import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../models/bmi_model.dart';

part 'bmi_state.dart';

class BmiCubit extends Cubit<BmiState> {
  BmiCubit() : super(BmiInitial());

  Future<void> getBmi (double height,double weight)async{
    emit(BmiLoading());
    try{
      final Dio dio = Dio();
      final res = await dio.get(
          'https://api.apiverve.com/v1/bmicalculator',
          queryParameters: {
            'height': height,
            'weight': weight,
            'unit': 'metric',
          },
          options: Options(
              headers: {
                'x-api-key':'1e229c20-312e-404e-8e11-e057deedc3ee',
              }
          )
      );
      final bmi = BmiModel.fromJson(res.data);
      emit(BmiSuccess(bmi));
    }catch(e){
      if(e is TypeError){
        print(e.stackTrace);
      }
      emit(BmiError(e.toString()));
    }

  }
}
