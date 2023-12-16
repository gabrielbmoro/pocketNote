import 'package:injectable/injectable.dart';
import 'package:pocket_note/data/local_data_source.dart';
import 'package:pocket_note/domain/models/power_bill.dart';

mixin PocketNoteRepository {
  Future<bool> save(PowerBill powerBill);

  Future<List<PowerBill>> getPowerBills();
}

@Injectable(as: PocketNoteRepository)
class PocketNoteRepositoryImpl with PocketNoteRepository {
  LocalDataSource localDataSource;

  PocketNoteRepositoryImpl({required this.localDataSource});

  @override
  Future<bool> save(PowerBill powerBill) async {
    return await localDataSource.insertPowerBill(
      lastReadingInKWm: powerBill.lastReadingInKWm,
      currentReadingInKWm: powerBill.currentReadingInKWm,
      neighborsTotalReadingInKWm: powerBill.neighborsTotalReadingInKWm,
      neighborsTotalValue: powerBill.neighborsTotalValue,
      date: powerBill.date,
    );
  }

  @override
  Future<List<PowerBill>> getPowerBills() async {
    final iterable = await localDataSource.getPowerBills();
    return iterable.toList();
  }
}
