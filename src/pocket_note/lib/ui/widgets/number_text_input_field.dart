import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_note/core/extensions/string_ext.dart';

class NumberTextInputField extends StatelessWidget {
  final String labelText;
  final Function(String?) onChanged;

  const NumberTextInputField(
      {super.key, required this.labelText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      onChanged: (text) {
        if (text.parseToDouble() != null) {
          onChanged(text);
        }
      },
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
