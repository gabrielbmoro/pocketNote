// Import the test package and Counter class
import 'package:pocket_note/domain/models/power_bill.dart';
import 'package:pocket_note/domain/models/total_power_bill.dart';
import 'package:pocket_note/domain/usecases/get_shareable_text_usecase.dart';
import 'package:test/test.dart';

void main() {
  test(
    'GetShareableTextUseCaseImpl should return right text with R\$ 304.5',
        () {
      final powerBill = PowerBill(
        lastReadingInKWm: 2907.5,
        currentReadingInKWm: 3117.5,
        neighborsTotalReadingInKWm: 633.0,
        neighborsTotalValue: 434.84,
        date: "2024-01-12 15:00:00 UTC",
      );
      TotalPowerBill totalPowerBill = TotalPowerBill(
        powerBill: powerBill,
        kWhValue: 1.4557078465642537,
        finalValue: 305.6986477784933,
        monthReadingInKWm: 210
      );
      final getShareableTextUseCaseImpl = GetShareableTextUseCaseImpl();

      final result = getShareableTextUseCaseImpl.invoke(totalPowerBill);

      String expected = "3117.50kW(leitura atual) - 2907.50kW(leitura passada) = 210.00kW (consumo do mês)\n\n"
          "633.00kW(total consumido da UC) / R\$434.84 (total da conta da UC) = R\$1.46 (preço do kW)\n\n"
          "Valor da nossa conta: 210.00kW * R\$1.46 = R\$305.70";

      expect(result, expected);
    },
  );
}
