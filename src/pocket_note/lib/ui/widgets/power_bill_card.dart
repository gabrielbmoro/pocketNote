import 'package:flutter/material.dart';
import 'package:pocket_note/domain/models/power_bill.dart';
import 'package:pocket_note/ui/widgets/row_label_value.dart';

// ignore: must_be_immutable
class PowerBillCard extends StatelessWidget {
  PowerBill powerBill;

  PowerBillCard({super.key, required this.powerBill});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(
              "Janeiro",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 14,),
            RowLabelValue(label: "Leitura atual:", value: powerBill.currentReadingInKWm.toStringAsFixed(2)),
            RowLabelValue(label: "Leitura passada:", value: powerBill.lastReadingInKWm.toStringAsFixed(2)),
            const RowLabelValue(label: "Consumo do mes:", value: "fazer"),
            RowLabelValue(
                label: "Total consumido unidade:", value: powerBill.neighborsTotalReadingInKWm.toStringAsFixed(2)),
            const RowLabelValue(label: "Valor do kwh:", value: "fazer"),
            SizedBox(
              width: double.maxFinite,
              child: Text(
                "=R\$12312",
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.end,
              ),
            ),
            const SizedBox(height: 14,),
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
