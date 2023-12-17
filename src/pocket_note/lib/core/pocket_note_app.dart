import 'package:flutter/material.dart';

import 'navigation/app_router.dart';

class PocketNoteApp extends StatelessWidget {
  final _appRouter = AppRouter();

  PocketNoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
        brightness: Brightness.light,
        typography: Typography(),
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
        brightness: Brightness.dark,
        typography: Typography(),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
