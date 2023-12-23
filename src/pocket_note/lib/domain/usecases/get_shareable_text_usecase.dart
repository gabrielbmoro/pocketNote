import 'package:injectable/injectable.dart';
import 'package:pocket_note/domain/models/power_bill.dart';
import 'package:pocket_note/domain/models/total_power_bill.dart';

mixin GetShareableTextUseCase {
  String invoke(TotalPowerBill totalPowerBill);
}

@Injectable(as: GetShareableTextUseCase)
class GetShareableTextUseCaseImpl implements GetShareableTextUseCase {
  @override
  String invoke(TotalPowerBill totalPowerBill) {
    PowerBill powerBill = totalPowerBill.powerBill;
    String currentReadingInKWm =
        powerBill.currentReadingInKWm.toStringAsFixed(2);
    String lastReadingInKWm = powerBill.lastReadingInKWm.toStringAsFixed(2);
    String monthReadingInKWm =
        totalPowerBill.monthReadingInKWm.toStringAsFixed(2);

    String pricePerKWm = totalPowerBill.kWhValue.toStringAsFixed(2);
    String finalValue = totalPowerBill.finalValue.toStringAsFixed(2);

    String neighborsTotalReadingInKWm =
        powerBill.neighborsTotalReadingInKWm.toStringAsFixed(2);
    String neighborsTotalValue =
        powerBill.neighborsTotalValue.toStringAsFixed(2);

    return "${currentReadingInKWm}kW(leitura atual) - ${lastReadingInKWm}kW(leitura passada) = ${monthReadingInKWm}kW (consumo do mês)\n\n"
        "${neighborsTotalReadingInKWm}kW(total consumido da UC) / R\$${neighborsTotalValue} (total da conta da UC) = R\$$pricePerKWm (preço do kW)\n\n"
        "Valor da nossa conta: ${monthReadingInKWm}kW * R\$$pricePerKWm = R\$$finalValue";
  }
}
