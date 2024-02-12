import 'package:flutter/material.dart';

import '../screens/resources/strings.dart';
import 'month_selector.dart';
import 'number_text_input_field.dart';

class AddPowerBillFormContent extends StatelessWidget {
  final ValueChanged<String?>? onMonthSelected;
  final Function(String?) onCurrentReadingChanged;
  final Function(String?) onLastReadingChanged;
  final Function(String?) onNeighborsTotalReadingChanged;
  final Function(String?) onNeighborsTotalValueChanged;
  final String? initialMonthName;

  const AddPowerBillFormContent({
    super.key,
    required this.onMonthSelected,
    required this.onCurrentReadingChanged,
    required this.onLastReadingChanged,
    required this.onNeighborsTotalReadingChanged,
    required this.onNeighborsTotalValueChanged,
    required this.initialMonthName,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                date,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(width: 12),
              MonthSelector(
                initialMonthSelected: initialMonthName,
                months: months,
                onSelected: onMonthSelected,
              )
            ],
          ),
          const SizedBox(height: 12),
          Text(
            house,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 12),
          NumberTextInputField(
            labelText: currentReadingInKWm,
            onChanged: onCurrentReadingChanged,
            autofocus: true,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 12),
          NumberTextInputField(
            labelText: previousReadingInKWm,
            onChanged: onLastReadingChanged,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          Text(
            neighborhood,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(height: 12),
          NumberTextInputField(
            labelText: totalConsumptionInKWm,
            onChanged: onNeighborsTotalReadingChanged,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 12),
          NumberTextInputField(
            labelText: totalCurrencyValue,
            onChanged: onNeighborsTotalValueChanged,
            textInputAction: TextInputAction.done,
          ),
        ],
      ),
    );
  }
}
