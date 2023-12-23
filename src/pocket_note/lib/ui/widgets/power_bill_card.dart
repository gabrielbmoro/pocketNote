import 'package:flutter/material.dart';
import 'package:pocket_note/ui/screens/resources/strings.dart';
import 'package:pocket_note/ui/widgets/row_label_value.dart';

// ignore: must_be_immutable
class PowerBillCard extends StatelessWidget {
  String currentReadingValueInKWm;
  String lastReadingValueInKWm;
  String neighborsTotalReadingValueInKWm;
  String kWhValue;
  String finalValue;
  String month;
  VoidCallback? onShareClickEvent;
  bool extraBottomSpace;

  PowerBillCard({
    super.key,
    required this.currentReadingValueInKWm,
    required this.lastReadingValueInKWm,
    required this.neighborsTotalReadingValueInKWm,
    required this.kWhValue,
    required this.finalValue,
    required this.month,
    required this.onShareClickEvent,
    required this.extraBottomSpace,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: extraBottomSpace
          ? const EdgeInsets.only(
              left: 0,
              top: 0,
              right: 0,
              bottom: 60,
            )
          : const EdgeInsets.all(0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                month,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 14,
              ),
              RowLabelValue(
                label: currentReadingInKWm,
                value: currentReadingValueInKWm,
              ),
              const SizedBox(
                height: 8,
              ),
              RowLabelValue(
                label: previousReadingInKWm,
                value: lastReadingValueInKWm,
              ),
              const SizedBox(
                height: 8,
              ),
              RowLabelValue(
                label: totalInKWMByUnit,
                value: neighborsTotalReadingValueInKWm,
              ),
              const SizedBox(
                height: 8,
              ),
              RowLabelValue(label: valuePerKWh, value: kWhValue),
              SizedBox(
                width: double.maxFinite,
                child: Text(
                  finalValue,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.end,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  const TextButton(
                    onPressed: null,
                    child: Text(addToBills),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: onShareClickEvent,
                    icon: const Icon(Icons.share),
                    alignment: Alignment.topRight,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
