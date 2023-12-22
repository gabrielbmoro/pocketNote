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

    String shareableText =
        "$currentReadingInKWm(leitura atual) - $lastReadingInKWm(leitura passada) = $monthReadingInKWm (consumo do mês)\n\n";
    shareableText +=
        "$neighborsTotalReadingInKWm (total consumido da UC) / R\$$neighborsTotalValue = $pricePerKWm (preço do kW)\n\n";
    shareableText +=
        "Valor da nossa conta: $monthReadingInKWm * $pricePerKWm = $finalValue";
    return shareableText;
  }
}
