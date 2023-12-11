import 'package:flutter/material.dart';
import 'package:pocket_note/core/pocket_note_app.dart';
import 'package:pocket_note/ui/screens/addpowerbill/store/add_power_bill_store.dart';

import 'core/di/injection.dart';

void main() {
  configureDependencies();

  getIt.registerLazySingleton(() => AddPowerBillStore(getIt()));

  runApp(PocketNoteApp());
}
