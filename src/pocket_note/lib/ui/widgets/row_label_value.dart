import 'package:flutter/material.dart';

class RowLabelValue extends StatelessWidget {
  final String label;
  final String value;

  const RowLabelValue({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: 14,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
