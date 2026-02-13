abstract class BmiState {}

class BmiInitial extends BmiState {}

class BmiLoading extends BmiState {}

class BmiSuccess extends BmiState {
  final String bmi;
  final String health;

  BmiSuccess({
    required this.bmi,
    required this.health,
  });
}

class BmiFailure extends BmiState {
  final String error;

  BmiFailure(this.error);
}
