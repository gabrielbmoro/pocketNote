import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocket_note/core/navigation/app_router.dart';
import 'package:pocket_note/ui/screens/resources/strings.dart';
import 'package:pocket_note/ui/widgets/custom_scaffold.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StackRouter router = AutoRouter.of(context);
    return CustomScaffold(
      appBarTitle: appName,
      backEvent: () => router.pop(),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            OutlinedButton(
              onPressed: () => {router.navigate(const PowerBillRoute())},
              child: const Text(powerBill),
            ),
            const OutlinedButton(
              onPressed: null,
              child: Text(monthlyBills),
            ),
            const OutlinedButton(
              onPressed: null,
              child: Text(toDoList),
            )
          ],
        ),
      ),
    );
  }
}
