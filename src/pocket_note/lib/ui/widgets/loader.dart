import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final bool isLoading;

  const Loader({super.key, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : const SizedBox.shrink(),
    );
  }
}
