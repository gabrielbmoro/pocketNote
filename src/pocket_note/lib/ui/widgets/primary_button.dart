import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  Function onPressed;
  String title;

  PrimaryButton({super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () => onPressed,
        child: Text(title),
      ),
    );
  }
}
