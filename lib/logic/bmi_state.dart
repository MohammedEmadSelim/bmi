import 'package:bmi/model/bmi_model.dart';



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