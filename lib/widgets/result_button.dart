import 'package:flutter/material.dart';

class ResultButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnText;

  const ResultButton({
    super.key,
    required this.onPressed,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          btnText,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}