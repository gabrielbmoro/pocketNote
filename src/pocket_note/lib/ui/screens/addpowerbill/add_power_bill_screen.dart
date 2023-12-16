import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocket_note/core/di/injection.dart';
import 'package:pocket_note/ui/screens/addpowerbill/add_power_bill_ui_state.dart';
import 'package:pocket_note/ui/screens/addpowerbill/store/add_power_bill_store.dart';
import 'package:pocket_note/ui/widgets/custom_scaffold.dart';
import 'package:pocket_note/ui/widgets/number_text_input_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pocket_note/ui/widgets/try_again_button.dart';

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
      body: Observer(
        builder: (_) => bodySection(
          context,
          _store.uiState,
          () => _store.save(),
        ),
      ),
    );
  }

  Widget bodySection(BuildContext context, AddPowerBillUIState uiState,
      VoidCallback onPressed) {
    switch (uiState.resultType) {
      case ResultType.success:
        return successBody();
      case ResultType.error:
        return errorBody(context, onPressed);
      case ResultType.loading:
        return const CircularProgressIndicator();
      default:
        return noneBody(onPressed);
    }
  }

  Widget errorBody(BuildContext context, VoidCallback onPressed) {
    return Column(children: [
      Text(
        "Something went wrong",
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        "Please check your connection, or restart the application.",
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      TryAgainButton(onPressed: onPressed),
    ]);
  }

  Widget successBody() {
    return const Text("Congrats");
  }

  Widget noneBody(VoidCallback onPressed) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Observer(
            builder: (_) => Text(
              style: Theme.of(context).textTheme.labelLarge,
              'Date ${_store.uiState.date}',
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
          PrimaryButton(title: "Save", onPressed: onPressed)
        ],
      ),
    );
  }
}
