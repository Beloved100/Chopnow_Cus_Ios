import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String errorMessage;
  final bool isValid;

  const CustomTextField({super.key, 
    required this.controller,
    required this.label,
    this.errorMessage = '',
    this.isValid = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            errorText: isValid ? null : errorMessage,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: isValid ? Colors.grey : Colors.red,
              ),
            ),
          ),
        ),
        if (!isValid)
          Text(
            errorMessage,
            style: TextStyle(color: Colors.red, fontSize: 12),
          ),
      ],
    );
  }
}
