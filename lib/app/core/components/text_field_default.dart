import 'package:flutter/material.dart';
import 'package:scoref_manager/app/core/ui/colors/color.dart';

class CustomTextFieldDefault extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String text;
  final FormFieldValidator<String>? validator;
  final String nameHint;
  const CustomTextFieldDefault({
    super.key,
    required this.nameHint,
    this.textEditingController,
    this.validator,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: const TextStyle(color: AppColors.textOnPrimaryLight),
      controller: textEditingController,
      decoration: InputDecoration(label: Text(text)),
    );
  }
}
