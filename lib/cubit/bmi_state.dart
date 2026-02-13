import 'package:bmi/calculation_model.dart';

abstract class BmiState {}

class BmiInitial extends BmiState {}

class BmiLoading extends BmiState {}

class BmiSuccess extends BmiState {
  final BmiData bmiData;

  BmiSuccess({required this.bmiData});
}

class BmiFailure extends BmiState {
  final String message;

  BmiFailure({required this.message});
}
