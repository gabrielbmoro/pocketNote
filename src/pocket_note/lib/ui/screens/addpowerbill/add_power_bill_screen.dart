import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocket_note/core/di/injection.dart';
import 'package:pocket_note/ui/screens/addpowerbill/store/add_power_bill_store.dart';
import 'package:pocket_note/ui/widgets/custom_scaffold.dart';
import 'package:pocket_note/ui/widgets/text_input_field.dart';

@RoutePage()
class AddPowerBillScreen extends StatefulWidget {
  const AddPowerBillScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddPowerBillScreenState();
}

class _AddPowerBillScreenState extends State<AddPowerBillScreen> {
  late AddPowerBillStore _store;

  final TextEditingController _currentReadingInKWm = TextEditingController();
  final TextEditingController _previousReadingInKWm = TextEditingController();
  final TextEditingController _totalNeighborReadingInKWm =
      TextEditingController();
  final TextEditingController _totalNeighborValue = TextEditingController();

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
              Text(
                "Casa",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              const SizedBox(
                height: 12,
              ),
              TextInputField(
                labelText: 'Leitura Atual (kWm):',
                textEditingController: _currentReadingInKWm,
              ),
              const SizedBox(
                height: 12,
              ),
              TextInputField(
                labelText: 'Leitura Passada (kWm):',
                textEditingController: _previousReadingInKWm,
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
              TextInputField(
                labelText: 'Total consumido da conta da CEEE (kWm):',
                textEditingController: _totalNeighborReadingInKWm,
              ),
              const SizedBox(
                height: 12,
              ),
              TextInputField(
                labelText: 'Valor total da conta da CEEE (R\$):',
                textEditingController: _totalNeighborValue,
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => {
                    _store.save(
                      totalNeighborReadingInKWm:
                          _totalNeighborReadingInKWm.text,
                      totalNeighborValue: _totalNeighborValue.text,
                      currentReadingInKWm: _currentReadingInKWm.text,
                      previousReadingInKWm: _previousReadingInKWm.text,
                    )
                  },
                  child: const Text(
                    "Save",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
