import 'package:flutter/material.dart';

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
      textCapitalization: TextCapitalization.words,
      validator: validator,
      style: Theme.of(context).textTheme.bodyLarge,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: text,
        hintText: nameHint,
      ),
    );
  }
}
