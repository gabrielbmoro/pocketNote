import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocket_note/core/di/injection.dart';
import 'package:pocket_note/ui/screens/addpowerbill/store/add_power_bill_store.dart';
import 'package:pocket_note/ui/widgets/custom_scaffold.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../widgets/add_power_bill_form.dart';
import '../../widgets/loader.dart';
import '../resources/strings.dart';

@RoutePage()
class AddPowerBillScreen extends StatefulWidget {
  const AddPowerBillScreen({super.key});

  @override
  State<StatefulWidget> createState() => _AddPowerBillScreenState();
}

class _AddPowerBillScreenState extends State<AddPowerBillScreen> {
  late AddPowerBillStore _store;

  bool _shouldUpdatePreviousScreen = false;

  final _formKey = GlobalKey<FormState>();

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
      backEvent: () => router.pop(_shouldUpdatePreviousScreen),
      floatingActionButton: FloatingActionButton(
        onPressed: _save,
        child: const Icon(Icons.save),
      ),
      body: Observer(
        builder: (_) => Stack(
          children: [
            Loader(isLoading: _store.uiState.isLoading),
            Form(
              key: _formKey,
              child: AddPowerBillForm(
                initialMonthName: _store.monthName,
                onCurrentReadingChanged: _store.setCurrentReading,
                onLastReadingChanged: _store.setLastReading,
                onMonthSelected: _store.setMonth,
                onNeighborsTotalReadingChanged: _store.setNeighborsTotalReading,
                onNeighborsTotalValueChanged: _store.setNeighborsTotalValue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _save() {
    if (_formKey.currentState?.validate() == true) {
      _store.save().then(
            (value) => _processAddPowerBillResult(value),
          );
    } else {
      _showFeedback(false);
    }
  }

  _processAddPowerBillResult(bool result) {
    if (result) {
      _shouldUpdatePreviousScreen = true;
    }

    _showFeedback(result);
  }

  _showFeedback(bool success) {
    SnackBar snackBar;
    if (success) {
      snackBar = const SnackBar(
        content: Text(addPowerBillSuccessfulMessage),
      );
    } else {
      snackBar = const SnackBar(
        content: Text(addPowerBillErrorMessage),
      );
    }
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
