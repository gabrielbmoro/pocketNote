import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget body;
  final VoidCallback? onFloatingActionButtonEvent;
  final VoidCallback? backEvent;

  const CustomScaffold(
      {super.key,
      required this.appBarTitle,
      required this.body,
      this.onFloatingActionButtonEvent,
      this.backEvent});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: backEvent != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => {backEvent!()},
              )
            : null,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: body,
      ),
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
