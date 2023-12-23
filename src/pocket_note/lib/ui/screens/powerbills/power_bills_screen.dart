import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pocket_note/core/navigation/app_router.dart';
import 'package:pocket_note/domain/models/total_power_bill.dart';
import 'package:pocket_note/ui/screens/powerbills/store/power_bills_store.dart';
import 'package:pocket_note/ui/widgets/custom_scaffold.dart';
import 'package:pocket_note/ui/widgets/power_bill_card.dart';

import '../../../core/di/injection.dart';

@RoutePage()
class PowerBillScreen extends StatefulWidget {
  const PowerBillScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PowerBillsScreenState();
}

class _PowerBillsScreenState extends State<PowerBillScreen> {
  late PowerBillsStore _store;

  @override
  void initState() {
    _store = getIt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StackRouter router = AutoRouter.of(context);
    return CustomScaffold(
      backEvent: () => router.pop(),
      appBarTitle: "Contas de Luz",
      body: Observer(
        builder: (_) => _body(_store.uiState.powerBills),
      ),
      onFloatingActionButtonEvent: (() => _goToAddPowerBillScreen(context)),
    );
  }

  Widget _body(List<TotalPowerBill>? powerBills) {
    if (powerBills == null) {
      return const Text("null");
    } else if (powerBills.isEmpty) {
      return const Text("empty");
    } else {
      return ListView.builder(
          itemCount: powerBills.length,
          itemBuilder: (context, index) => _buildItem(powerBills[index], index == powerBills.length - 1));
    }
  }

  Widget _buildItem(TotalPowerBill totalPowerBill, bool isLatest) {
    return PowerBillCard(
      month: totalPowerBill.powerBill.date,
      currentReadingValueInKWm:
          totalPowerBill.powerBill.currentReadingInKWm.toStringAsFixed(2),
      lastReadingValueInKWm:
          totalPowerBill.powerBill.lastReadingInKWm.toStringAsFixed(2),
      neighborsTotalReadingValueInKWm: totalPowerBill
          .powerBill.neighborsTotalReadingInKWm
          .toStringAsFixed(2),
      kWhValue: totalPowerBill.kWhValue.toStringAsFixed(2),
      finalValue: totalPowerBill.finalValue.toStringAsFixed(2),
      onShareClickEvent: ()=> {_store.onShareClickEvent(totalPowerBill)},
      extraBottomSpace: isLatest
    );
  }

  _goToAddPowerBillScreen(BuildContext context) async {
    StackRouter router = AutoRouter.of(context);
    final result = await router.pushNamed("/${AddPowerBillRoute.name}");
    if (result == true) {
      _store.reload();
    }
  }
}
