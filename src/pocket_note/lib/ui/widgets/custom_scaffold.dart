import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String appBarTitle;
  final Widget body;
  final VoidCallback? backEvent;
  final FloatingActionButton? floatingActionButton;
  final EdgeInsets edgeInsets;

  const CustomScaffold({
    super.key,
    required this.appBarTitle,
    required this.body,
    this.backEvent,
    this.floatingActionButton,
    this.edgeInsets = const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
  });

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
        padding: edgeInsets,
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
