import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pocket_note/core/navigation/app_router.dart';
import 'package:pocket_note/ui/screens/powerbills/store/power_bills_store.dart';
import 'package:pocket_note/ui/widgets/custom_scaffold.dart';
import 'package:pocket_note/ui/widgets/power_bill_card.dart';

import '../../../core/di/injection.dart';
import '../../../domain/models/power_bill.dart';

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
      hasBackArrow: true,
      appBarTitle: "Contas de Luz",
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Observer(
          builder: (_) => _body(_store.uiState.powerBills),
        ),
      ),
      onFloatingActionButtonEvent: (() =>
          {router.navigate(const AddPowerBillRoute())}),
    );
  }

  Widget _body(List<PowerBill>? powerBills) {
    if (powerBills == null) {
      return const Text("null");
    } else if (powerBills.isEmpty) {
      return const Text("empty");
    } else {
      return ListView.builder(
          itemBuilder: (context, index) => _buildItem(powerBills[index]));
    }
  }

  Widget _buildItem(PowerBill powerBill) {
    return PowerBillCard(powerBill: powerBill);
  }
}
