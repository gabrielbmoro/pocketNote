import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pocket_note/core/extensions/string_ext.dart';
import 'package:pocket_note/ui/screens/resources/strings.dart';

class NumberTextInputField extends StatelessWidget {
  final String labelText;
  final Function(String?) onChanged;
  final TextInputAction? textInputAction;
  final bool autofocus;

  const NumberTextInputField({
    super.key,
    required this.labelText,
    required this.onChanged,
    this.textInputAction,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      textInputAction: textInputAction,
      autofocus: autofocus,
      onChanged: onChanged,
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9.]"))],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value?.parseToDouble() == null ? invalidInputNumber : null,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }
}
