import 'package:flutter/material.dart';
import 'package:pocket_note/core/pocket_note_app.dart';

import 'core/di/injection.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(PocketNoteApp());
}
