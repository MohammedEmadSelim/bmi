import 'package:bmi/app_color.dart';
import 'package:bmi/cubit/bmi_cubit.dart';
import 'package:bmi/cubit/bmi_state.dart';
import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum Gender { male, female }

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  final _nameController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  DateTime? _selectedDate;
  Gender? _selectedGender;

  @override
  void dispose() {
    _nameController.dispose();
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1920),
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColor.primary,
              onPrimary: AppColor.white,
              surface: AppColor.white,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _calculate() {
    if (_nameController.text.isEmpty ||
        _selectedDate == null ||
        _selectedGender == null ||
        _weightController.text.isEmpty ||
        _heightController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    final weight = double.tryParse(_weightController.text);
    final height = double.tryParse(_heightController.text);

    if (weight == null || height == null || weight <= 0 || height <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please enter valid weight and height'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    context.read<BmiCubit>().calBMI(weight: weight, height: height);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BmiCubit, BmiState>(
      listener: (context, state) {
        if (state is BmiSuccess) {
          final age = DateTime.now().year - _selectedDate!.year;
          final genderStr = _selectedGender == Gender.male ? 'male' : 'female';
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                bmiData: state.bmiData,
                name: _nameController.text,
                age: age,
                gender: genderStr,
              ),
            ),
          );
        } else if (state is BmiFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.message}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColor.darkPurple),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Enter Your Details',
            style: TextStyle(
              color: AppColor.darkPurple,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Name ---
              _buildLabel('Name'),
              const SizedBox(height: 8),
              _buildTextField(
                controller: _nameController,
                hint: 'Enter your name',
                icon: Icons.person_outline,
              ),
              const SizedBox(height: 20),

              // --- Birth Date ---
              _buildLabel('Birth Date'),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _pickDate,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.greyWhite,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppColor.primary.withOpacity(0.3),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.calendar_today, color: AppColor.primary),
                      const SizedBox(width: 12),
                      Text(
                        _selectedDate != null
                            ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
                            : 'Select your birth date',
                        style: TextStyle(
                          fontSize: 16,
                          color: _selectedDate != null
                              ? AppColor.darkPurple
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // --- Gender ---
              _buildLabel('Gender'),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildGenderCard(
                      gender: Gender.male,
                      icon: Icons.male,
                      label: 'Male',
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildGenderCard(
                      gender: Gender.female,
                      icon: Icons.female,
                      label: 'Female',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // --- Weight & Height ---
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Weight (kg)'),
                        const SizedBox(height: 8),
                        _buildTextField(
                          controller: _weightController,
                          hint: 'e.g. 70',
                          icon: Icons.monitor_weight_outlined,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel('Height (cm)'),
                        const SizedBox(height: 8),
                        _buildTextField(
                          controller: _heightController,
                          hint: 'e.g. 170',
                          icon: Icons.height,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // --- Calculate Button ---
              BlocBuilder<BmiCubit, BmiState>(
                builder: (context, state) {
                  final isLoading = state is BmiLoading;
                  return SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _calculate,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.darkPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: isLoading
                          ? SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(
                                color: AppColor.white,
                                strokeWidth: 2.5,
                              ),
                            )
                          : Text(
                              'Calculate BMI',
                              style: TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColor.darkPurple,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: AppColor.primary),
        filled: true,
        fillColor: AppColor.greyWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.primary.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.primary.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.primary, width: 2),
        ),
      ),
    );
  }

  Widget _buildGenderCard({
    required Gender gender,
    required IconData icon,
    required String label,
  }) {
    final isSelected = _selectedGender == gender;
    return GestureDetector(
      onTap: () => setState(() => _selectedGender = gender),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : AppColor.greyWhite,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? AppColor.darkPurple
                : AppColor.primary.withOpacity(0.3),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 50,
              color: isSelected ? AppColor.white : AppColor.primary,
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isSelected ? AppColor.white : AppColor.darkPurple,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
