import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String labelText;
  final Function(String?) onChanged;

  const TextInputField({
    super.key,
    required this.labelText,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
