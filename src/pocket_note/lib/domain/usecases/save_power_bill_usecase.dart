import 'package:injectable/injectable.dart';
import 'package:pocket_note/data/pocket_note_repository.dart';

import '../models/power_bill.dart';

mixin SavePowerBillUseCase {
  Future<bool> invoke(PowerBill powerBill);
}

@Injectable(as: SavePowerBillUseCase)
class SavePowerBillUseCaseImpl implements SavePowerBillUseCase {
  final PocketNoteRepository repository;

  SavePowerBillUseCaseImpl({required this.repository});

  @override
  Future<bool> invoke(PowerBill powerBill) {
    return repository.save(powerBill);
  }
}
