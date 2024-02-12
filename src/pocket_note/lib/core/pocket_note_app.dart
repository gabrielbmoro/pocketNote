import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:pocket_note/ui/screens/resources/strings.dart';

import 'navigation/app_router.dart';

class PocketNoteApp extends StatelessWidget {
  final _appRouter = AppRouter();

  PocketNoteApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      return _buildDynamicColorWidget(lightDynamic, darkDynamic);
    });
  }

  Widget _buildDynamicColorWidget(
    ColorScheme? lightDynamic,
    ColorScheme? darkDynamic,
  ) {
    ColorScheme lightColors = lightDynamic ??
        ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        );

    ColorScheme darkColors = darkDynamic ??
        ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        );
    ;

    return MaterialApp.router(
      title: appName,
      theme: ThemeData(
        colorScheme: lightColors,
        useMaterial3: true,
        brightness: Brightness.light,
        typography: Typography(),
      ),
      darkTheme: ThemeData(
        colorScheme: darkColors,
        useMaterial3: true,
        brightness: Brightness.dark,
        typography: Typography(),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
