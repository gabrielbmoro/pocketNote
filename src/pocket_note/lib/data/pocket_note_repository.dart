import 'package:pocket_note/data/local_data_source.dart';
import 'package:pocket_note/domain/models/power_bill.dart';

mixin PocketNoteRepository {
  Future<bool> save(PowerBill powerBill);
}

class PocketNoteRepositoryImpl with PocketNoteRepository {
  LocalDataSource localDataSource;

  PocketNoteRepositoryImpl({required this.localDataSource});

  @override
  Future<bool> save(PowerBill powerBill) {
    return localDataSource.insertPowerBill(
      lastReadingInKWm: powerBill.lastReadingInKWm,
      currentReadingInKWm: powerBill.currentReadingInKWm,
      neighborsTotalReadingInKWm: powerBill.neighborsTotalReadingInKWm,
      neighborsTotalValue: powerBill.neighborsTotalValue,
      date: powerBill.date,
    );
  }
}
