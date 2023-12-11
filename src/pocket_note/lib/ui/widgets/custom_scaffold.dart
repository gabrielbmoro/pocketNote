import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget body;
  final VoidCallback? onFloatingActionButtonEvent;
  final bool? hasBackArrow;

  const CustomScaffold(
      {super.key,
      required this.appBarTitle,
      required this.body,
      this.onFloatingActionButtonEvent,
      this.hasBackArrow});

  @override
  Widget build(BuildContext context) {
    StackRouter router = AutoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: hasBackArrow == true
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => {router.pop()},
              )
            : null,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(appBarTitle),
      ),
      body: body,
      floatingActionButton: floatingActionButton(),
    );
  }

  Widget? floatingActionButton() {
    if (onFloatingActionButtonEvent != null) {
      return FloatingActionButton(
        onPressed: onFloatingActionButtonEvent,
        child: const Icon(Icons.add),
      );
    } else {
      return null;
    }
  }
}
