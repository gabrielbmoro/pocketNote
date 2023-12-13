import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LocalDataSource {
  static const databaseName = "pocket_note_database.db";

  static const powerBillsTableName = "power_bills";
  static const powerBillsIdKey = "id";
  static const powerBillsLastReadingInKwmKey = "last_reading_in_kwm";
  static const powerBillsCurrentReadingInKwmKey = "current_reading_in_kwm";
  static const powerBillsNeighborsTotalReadingInKwmKey =
      "neighbors_total_reading_in_kwm";
  static const powerBillsNeighborsTotalValueKey = "neighbors_total_value";
  static const powerBillsDateKey = "date";

  late Database _database;

  LocalDataSource() {
    init().then((value) => debugPrint("Data base initialized"));
  }

  Future<void> init() async {
    // Open the database and store the reference.
    _database = await openDatabase(
      // Set the path to the database. Note: Using the `join` function from the
      // `path` package is best practice to ensure the path is correctly
      // constructed for each platform.
      join(await getDatabasesPath(), databaseName),

      onCreate: (db, version) {
        // Run the CREATE TABLE statement on the database.
        return db.execute(
          'CREATE TABLE $powerBillsTableName('
          '$powerBillsIdKey INTEGER PRIMARY KEY, '
          '$powerBillsLastReadingInKwmKey REAL, '
          '$powerBillsCurrentReadingInKwmKey REAL, '
          '$powerBillsNeighborsTotalReadingInKwmKey REAL, '
          '$powerBillsNeighborsTotalValueKey REAL'
          '$powerBillsDateKey TEXT,'
          ')',
        );
      },
    );
  }

  insertPowerBill({
    required double lastReadingInKWm,
    required double currentReadingInKWm,
    required double neighborsTotalReadingInKWm,
    required double neighborsTotalValue,
    required String date,
  }) async {
    Map<String, Object> values = {
      powerBillsLastReadingInKwmKey: lastReadingInKWm,
      powerBillsCurrentReadingInKwmKey: currentReadingInKWm,
      powerBillsNeighborsTotalValueKey: neighborsTotalValue,
      powerBillsDateKey: date,
      powerBillsNeighborsTotalReadingInKwmKey: neighborsTotalReadingInKWm,
    };

    final result = await _database.insert(powerBillsTableName, values);
    return result == 0 ? false : true;
  }
}
