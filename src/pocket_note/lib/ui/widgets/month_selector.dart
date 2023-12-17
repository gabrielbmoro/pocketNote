import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MonthSelector extends StatelessWidget {
  String? initialMonthSelected;
  List<String> months;
  ValueChanged<String?>? onSelected;

  MonthSelector({
    super.key,
    required this.initialMonthSelected,
    required this.months,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      onSelected: onSelected,
      initialSelection: initialMonthSelected,
      dropdownMenuEntries:
          months.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
    );
  }
}
