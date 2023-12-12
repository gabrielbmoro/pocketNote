import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocket_note/core/navigation/app_router.dart';
import 'package:pocket_note/ui/widgets/custom_scaffold.dart';
import 'package:pocket_note/ui/widgets/power_bill_card.dart';

@RoutePage()
class PowerBillScreen extends StatelessWidget {
  const PowerBillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StackRouter router = AutoRouter.of(context);
    return CustomScaffold(
      hasBackArrow: true,
      appBarTitle: "Contas de Luz",
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: SingleChildScrollView(
            child: Column(
          children: [PowerBillCard(), PowerBillCard(), PowerBillCard()],
        )),
      ),
      onFloatingActionButtonEvent: (() =>
          {router.navigate(const AddPowerBillRoute())}),
    );
  }
}
