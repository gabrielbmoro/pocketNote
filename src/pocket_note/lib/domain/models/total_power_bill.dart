import 'package:pocket_note/domain/models/power_bill.dart';

class TotalPowerBill {
  PowerBill powerBill;
  double kWhValue;
  double finalValue;
  double monthReadingInKWm;

  TotalPowerBill({
    required this.powerBill,
    required this.kWhValue,
    required this.finalValue,
    required this.monthReadingInKWm,
  });
}
