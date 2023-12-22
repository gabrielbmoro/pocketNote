import 'package:injectable/injectable.dart';
import 'package:pocket_note/domain/models/total_power_bill.dart';

import '../models/power_bill.dart';

mixin CalculatePowerBillUseCase {
  TotalPowerBill invoke(PowerBill powerBill);
}

@Injectable(as: CalculatePowerBillUseCase)
class CalculatePowerBillUseCaseImpl implements CalculatePowerBillUseCase {
  @override
  TotalPowerBill invoke(PowerBill powerBill) {
    double monthReadingInKWm =
        powerBill.currentReadingInKWm - powerBill.lastReadingInKWm;

    double valueOfOneKWm =
        powerBill.neighborsTotalReadingInKWm / powerBill.neighborsTotalValue;

    double totalValue = monthReadingInKWm * valueOfOneKWm;

    return TotalPowerBill(
      powerBill: powerBill,
      kWhValue: valueOfOneKWm,
      finalValue: totalValue,
      monthReadingInKWm: monthReadingInKWm,
    );
  }
}
