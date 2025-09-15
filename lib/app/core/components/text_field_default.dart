import 'package:flutter/material.dart';

class CustomTextFieldDefault extends StatelessWidget {
  final TextEditingController? textEditingController;
  final FormFieldValidator<String>? validator;
  final String nameHint;
  const CustomTextFieldDefault({
    super.key,
    required this.nameHint,
    this.textEditingController,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: const TextStyle(color: Colors.black),
      controller: textEditingController,
      decoration: InputDecoration(label: Text("Inpute de teste")),
    );
  }
}
