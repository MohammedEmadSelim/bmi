import 'package:flutter/material.dart';
import '../service/service.dart';

class BmiViewModel extends ChangeNotifier {
  final BmiService _bmiService = BmiService();

  bool isLoading = false;
  String? bmiResult;
  String? healthStatus;

  Future<void> calculateBMI({
    required double weight,
    required double height,
    required String gender,
  }) async {
    isLoading = true;
    notifyListeners();

    final response = await _bmiService.fetchBmiData(
      weight: weight,
      height: height,
      gender: gender,
    );

    if (response != null && response['data'] != null) {
      bmiResult = response['data']['bmi'].toStringAsFixed(1);
      healthStatus = response['data']['health'];
    }

    isLoading = false;
    notifyListeners();
  }
}