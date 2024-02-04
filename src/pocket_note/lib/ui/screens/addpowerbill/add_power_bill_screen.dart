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
        onPressed: () {
          _addPowerBillEvent(context);
        },
        child: const Icon(Icons.save),
      ),
      body: Observer(
        builder: (_) => Stack(
          children: [
            Loader(isLoading: _store.uiState.isLoading),
            AddPowerBillForm(
              initialMonthName: _store.monthName,
              onCurrentReadingChanged: _store.setCurrentReading,
              onLastReadingChanged: _store.setLastReading,
              onMonthSelected: _store.setMonth,
              onNeighborsTotalReadingChanged: _store.setNeighborsTotalReading,
              onNeighborsTotalValueChanged: _store.setNeighborsTotalValue,
            ),
          ],
        ),
      ),
    );
  }

  Future<SnackBar> _save(VoidCallback? onRetry) async {
    bool result = await _store.save();
    SnackBar snackBar;
    if (result) {
      snackBar = const SnackBar(
        content: Text(addPowerBillSuccessfulMessage),
      );
      _shouldUpdatePreviousScreen = true;
    } else {
      if (onRetry == null) {
        snackBar = const SnackBar(
          content: Text(addPowerBillErrorMessage),
        );
      } else {
        snackBar = SnackBar(
          content: const Text(addPowerBillErrorMessageWithRetry),
          action: SnackBarAction(label: retry, onPressed: onRetry),
        );
      }
    }
    return snackBar;
  }

  _addPowerBillEvent(BuildContext context) {
    _save(() => _onRetry()).then(
      (snackBar) => ScaffoldMessenger.of(context).showSnackBar(snackBar),
    );
  }

  _onRetry() async {
    _save(null).then(
      (snackBar) => ScaffoldMessenger.of(context).showSnackBar(snackBar),
    );
  }
}
