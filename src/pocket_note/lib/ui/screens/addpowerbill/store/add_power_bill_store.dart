import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pocket_note/core/extensions/string_ext.dart';
import 'package:pocket_note/domain/models/power_bill.dart';
import '../../../../domain/usecases/save_power_bill_usecase.dart';
import '../add_power_bill_ui_state.dart';

part 'add_power_bill_store.g.dart';

@injectable
class AddPowerBillStore = AddPowerBillBase with _$AddPowerBillStore;

abstract class AddPowerBillBase with Store {
  String? _lastReading;
  String? _currentReading;
  String? _neighborsTotalReading;
  String? _neighborsTotalValue;
  final List<String> months = [
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro"
  ];
  String? monthName;

  @observable
  AddPowerBillUIState uiState = AddPowerBillUIState(
    resultType: null,
  );

  final SavePowerBillUseCase savePowerBillUseCase;

  AddPowerBillBase(this.savePowerBillUseCase) {
    monthName = months[DateTime.now().month - 1];
  }

  void setLastReading(String? lastReading) {
    _lastReading = lastReading;
  }

  void setCurrentReading(String? currentReading) {
    _currentReading = currentReading;
  }

  void setMonth(String? month) {
    monthName = month;
  }

  void setNeighborsTotalReading(String? neighborsTotalReading) {
    _neighborsTotalReading = neighborsTotalReading;
  }

  void setNeighborsTotalValue(String? neighborsTotalValue) {
    _neighborsTotalValue = neighborsTotalValue;
  }

  @action
  void save() {
    final date = monthName ?? "";
    final lastReadingInKWm = _lastReading!.parseToDouble() ?? 0.0;
    final currentReadingInKWm = _currentReading!.parseToDouble() ?? 0.0;
    final neighborsTotalValue = _neighborsTotalValue!.parseToDouble() ?? 0.0;
    final neighborsTotalReadingInKWm =
        _neighborsTotalReading!.parseToDouble() ?? 0.0;

    final PowerBill powerBill = PowerBill(
      date: date,
      lastReadingInKWm: lastReadingInKWm,
      currentReadingInKWm: currentReadingInKWm,
      neighborsTotalValue: neighborsTotalValue,
      neighborsTotalReadingInKWm: neighborsTotalReadingInKWm,
    );
    uiState = AddPowerBillUIState(
      resultType: ResultType.loading,
    );
    savePowerBillUseCase
        .invoke(powerBill)
        .then((value) => _onSaveSuccess(value))
        .catchError((stackTrace) => _onError);
  }

  _onSaveSuccess(bool value) {
    if (value) {
      uiState = AddPowerBillUIState(
        resultType: ResultType.success,
      );
    } else {
      _onError();
    }
  }

  _onError() {
    uiState = AddPowerBillUIState(
      resultType: ResultType.error,
    );
  }
}
