import 'package:injectable/injectable.dart';

import '../models/power_bill.dart';

mixin SavePowerBillUseCase {
  Future<bool> invoke(PowerBill powerBill);
}

@Injectable(as: SavePowerBillUseCase)
class SavePowerBillUseCaseImpl implements SavePowerBillUseCase {
  @override
  Future<bool> invoke(PowerBill powerBill) async {
    return false;
  }
}
