import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';

import '../models/power_bill.dart';

mixin CalculatePowerBillUseCase {
  String invoke(PowerBill powerBill);
}

@Injectable(as: CalculatePowerBillUseCase)
class CalculatePowerBillUseCaseImpl implements CalculatePowerBillUseCase {
  @override
  String invoke(PowerBill powerBill) {
    double monthReading =
        powerBill.currentReadingInKWm - powerBill.lastReadingInKWm;

    double valueOfOneKWm =
        powerBill.neighborsTotalReadingInKWm / powerBill.neighborsTotalValue;

    double totalValue = monthReading * valueOfOneKWm;

    final oCcy = NumberFormat("#,##0.00", "pt_BR");
    String finalValue = oCcy.format(totalValue);
    return "R\$ $finalValue";
  }
}
