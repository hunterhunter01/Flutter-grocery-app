import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final FormFieldValidator<String?>? validator;
  final TextInputType keyboardType;

  const CustomTextForm({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    required this.validator, required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.blueGrey),
        errorBorder: OutlineInputBorder(
          borderRadius: .circular(4),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: .circular(4),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
      ),
    );
  }
}
