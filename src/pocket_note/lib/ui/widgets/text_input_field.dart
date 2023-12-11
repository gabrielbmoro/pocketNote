import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController textEditingController;

  const TextInputField({
    super.key,
    required this.labelText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
