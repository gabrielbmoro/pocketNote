import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TryAgainButton extends StatelessWidget {
  VoidCallback? onPressed;

  TryAgainButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.refresh),
        label: const Text("Try again"),
      ),
    );
  }
}
