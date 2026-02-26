part of 'bmi_cubit.dart';

@immutable
sealed class BmiState {}

final class BmiInitial extends BmiState {}

final class BmiLoading extends BmiState {}

final class BmiSuccess extends BmiState {
  final BmiModel bmi;
  BmiSuccess(this.bmi);
}

final class BmiError extends BmiState {
  final String message;
  BmiError(this.message);
}