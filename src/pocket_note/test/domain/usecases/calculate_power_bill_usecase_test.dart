// Import the test package and Counter class
import 'package:pocket_note/domain/models/power_bill.dart';
import 'package:pocket_note/domain/usecases/calculate_power_bill_usecase.dart';
import 'package:test/test.dart';

void main() {
  test(
    'CalculatePowerBillUseCaseImpl should return R\$ 304.5',
    () {
      final powerBill = PowerBill(
          lastReadingInKWm: 2907.5,
          currentReadingInKWm: 3117.5,
          neighborsTotalReadingInKWm: 633.0,
          neighborsTotalValue: 434.84);
      final calculatePowerBillUseCaseImpl = CalculatePowerBillUseCaseImpl();

      final result = calculatePowerBillUseCaseImpl.invoke(powerBill);

      expect(result.finalValue, 'R\$ 305,70');
    },
  );
}
