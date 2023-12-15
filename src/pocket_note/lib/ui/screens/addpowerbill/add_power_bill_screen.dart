import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocket_note/core/di/injection.dart';
import 'package:pocket_note/ui/screens/addpowerbill/store/add_power_bill_store.dart';
import 'package:pocket_note/ui/widgets/custom_scaffold.dart';
import 'package:pocket_note/ui/widgets/number_text_input_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../widgets/primary_button.dart';

@RoutePage()
class AddPowerBillScreen extends StatefulWidget {
  const AddPowerBillScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddPowerBillScreenState();
}

class _AddPowerBillScreenState extends State<AddPowerBillScreen> {
  late AddPowerBillStore _store;

  @override
  void initState() {
    _store = getIt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: "Add Power Bill",
      hasBackArrow: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(
                builder: (_) => Text(
                  style: Theme.of(context).textTheme.labelLarge,
                  'Date ${_store.date}',
                ),
              ),
              Text(
                "Casa",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 12,
              ),
              NumberTextInputField(
                labelText: 'Leitura Atual (kWm):',
                onChanged: _store.setCurrentReading,
              ),
              const SizedBox(
                height: 12,
              ),
              NumberTextInputField(
                labelText: 'Leitura Passada (kWm):',
                onChanged: _store.setLastReading,
              ),
              const SizedBox(
                height: 12,
              ),
              const Divider(),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Condominio",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 12,
              ),
              NumberTextInputField(
                labelText: 'Total consumido da conta da CEEE (kWm):',
                onChanged: _store.setNeighborsTotalReading,
              ),
              const SizedBox(
                height: 12,
              ),
              NumberTextInputField(
                labelText: 'Valor total da conta da CEEE (R\$):',
                onChanged: _store.setNeighborsTotalValue,
              ),
              const SizedBox(
                height: 30,
              ),
              Observer(
                builder: (_) => primaryButton(
                  success: _store.success,
                  onPressed: () => {_store.save()},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget primaryButton({required bool? success, required VoidCallback onPressed}) {
    if (success == true) {
      return PrimaryButton(title: "Saved", onPressed: null);
    } else {
      return PrimaryButton(title: "Save", onPressed: onPressed);
    }
  }
}
