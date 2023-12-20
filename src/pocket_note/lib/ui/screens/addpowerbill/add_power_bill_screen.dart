import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocket_note/core/di/injection.dart';
import 'package:pocket_note/ui/screens/addpowerbill/add_power_bill_ui_state.dart';
import 'package:pocket_note/ui/screens/addpowerbill/store/add_power_bill_store.dart';
import 'package:pocket_note/ui/widgets/custom_scaffold.dart';
import 'package:pocket_note/ui/widgets/month_selector.dart';
import 'package:pocket_note/ui/widgets/number_text_input_field.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pocket_note/ui/widgets/try_again_button.dart';

import '../../widgets/primary_button.dart';
import '../resources/strings.dart';

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
    StackRouter router = AutoRouter.of(context);
    return CustomScaffold(
      appBarTitle: addPowerBill,
      backEvent: () =>
          router.pop(_store.uiState.resultType == ResultType.success),
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
        somethingWentWrong,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      Text(
        checkYourConnectionMessage,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      TryAgainButton(onPressed: onPressed),
    ]);
  }

  Widget successBody() {
    return const Text(successAndTurnBackMessage);
  }

  Widget noneBody(VoidCallback onPressed) {
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
                initialMonthSelected: _store.monthName,
                months: months,
                onSelected: _store.setMonth,
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            "Casa",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(
            height: 12,
          ),
          NumberTextInputField(
            labelText: currentReadingInKWm,
            onChanged: _store.setCurrentReading,
          ),
          const SizedBox(
            height: 12,
          ),
          NumberTextInputField(
            labelText: previousReadingInKWm,
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
            neighborhood,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          const SizedBox(
            height: 12,
          ),
          NumberTextInputField(
            labelText: totalConsumptionInKWm,
            onChanged: _store.setNeighborsTotalReading,
          ),
          const SizedBox(
            height: 12,
          ),
          NumberTextInputField(
            labelText: totalCurrencyValue,
            onChanged: _store.setNeighborsTotalValue,
          ),
          const SizedBox(
            height: 30,
          ),
          PrimaryButton(title: add, onPressed: onPressed)
        ],
      ),
    );
  }
}
