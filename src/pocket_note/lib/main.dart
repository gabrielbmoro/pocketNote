import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:pocket_note/core/pocket_note_app.dart';
import 'package:pocket_note/data/local_data_source.dart';
import 'package:pocket_note/data/pocket_note_repository.dart';
import 'package:pocket_note/ui/screens/addpowerbill/store/add_power_bill_store.dart';
import 'package:sqflite/sqflite.dart';

import 'core/di/injection.dart';

void main() {
  configureDependencies();

  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();

  getIt.registerSingleton(LocalDataSource());
  getIt.registerLazySingleton<PocketNoteRepository>(
    () => PocketNoteRepositoryImpl(localDataSource: getIt()),
  );
  getIt.registerLazySingleton(() => AddPowerBillStore());

  runApp(PocketNoteApp());
}
