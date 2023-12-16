import 'package:injectable/injectable.dart';
import 'package:pocket_note/data/pocket_note_repository.dart';

import '../models/power_bill.dart';

mixin GetPowerBillsUseCase {
  Future<List<PowerBill>> invoke();
}

@Injectable(as: GetPowerBillsUseCase)
class GetPowerBillsUseCaseImpl implements GetPowerBillsUseCase {
  final PocketNoteRepository repository;

  GetPowerBillsUseCaseImpl({required this.repository});

  @override
  Future<List<PowerBill>> invoke() async {
    return await repository.getPowerBills();
  }
}
