import 'package:flutter/material.dart';
import 'package:pocket_note/ui/widgets/row_label_value.dart';

// ignore: must_be_immutable
class PowerBillCard extends StatelessWidget {
  String currentReadingInKWm;
  String lastReadingInKWm;
  String neighborsTotalReadingInKWm;
  String kWhValue;
  String finalValue;
  String month;

  PowerBillCard(
      {super.key,
      required this.currentReadingInKWm,
      required this.lastReadingInKWm,
      required this.neighborsTotalReadingInKWm,
      required this.kWhValue,
      required this.finalValue,
      required this.month});

  @override
  Widget build(BuildContext context) {
    return Card(
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
            RowLabelValue(label: "Leitura atual:", value: currentReadingInKWm),
            RowLabelValue(label: "Leitura passada:", value: lastReadingInKWm),
            RowLabelValue(
                label: "Total consumido unidade:",
                value: neighborsTotalReadingInKWm),
            RowLabelValue(label: "Valor do kwh:", value: kWhValue),
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
                TextButton(
                  onPressed: () => {},
                  child: const Text("Add to bills"),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () => {},
                  icon: const Icon(Icons.share),
                  alignment: Alignment.topRight,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
