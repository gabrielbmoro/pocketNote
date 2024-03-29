import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pocket_note/core/navigation/app_router.dart';
import 'package:pocket_note/ui/screens/resources/strings.dart';
import 'package:pocket_note/ui/widgets/custom_scaffold.dart';
import 'package:pocket_note/ui/widgets/secondary_button.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StackRouter router = AutoRouter.of(context);
    return CustomScaffold(
      appBarTitle: appName,
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SecondaryButton(
              onPressed: () => {router.navigate(const PowerBillRoute())},
              title: powerBill,
            ),
            SecondaryButton(onPressed: null, title: monthlyBills),
            SecondaryButton(onPressed: null, title: toDoList)
          ],
        ),
      ),
    );
  }
}
