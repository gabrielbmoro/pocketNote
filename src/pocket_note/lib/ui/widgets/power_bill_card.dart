import 'package:flutter/material.dart';
import 'package:pocket_note/ui/widgets/row_label_value.dart';

// ignore: must_be_immutable
class PowerBillCard extends StatelessWidget {
  const PowerBillCard({super.key});

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
            const RowLabelValue(label: "Leitura atual:", value: "3141491"),
            const RowLabelValue(label: "Leitura passada:", value: "3141491"),
            const RowLabelValue(label: "Consumo do mes:", value: "3141491"),
            const RowLabelValue(
                label: "Total consumido unidade:", value: "3141491"),
            const RowLabelValue(label: "Valor do kwh:", value: "3141491"),
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
