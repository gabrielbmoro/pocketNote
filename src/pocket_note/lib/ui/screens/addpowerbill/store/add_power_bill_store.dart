import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pocket_note/core/extensions/string_ext.dart';
import 'package:pocket_note/domain/models/power_bill.dart';
import '../../../../domain/usecases/save_power_bill_usecase.dart';
import '../../resources/strings.dart';
import '../add_power_bill_ui_state.dart';

part 'add_power_bill_store.g.dart';

@injectable
class AddPowerBillStore = AddPowerBillBase with _$AddPowerBillStore;

abstract class AddPowerBillBase with Store {
  String? _lastReading;
  String? _currentReading;
  String? _neighborsTotalReading;
  String? _neighborsTotalValue;
  String? monthName;

  @observable
  AddPowerBillUIState uiState = AddPowerBillUIState(
    isLoading: false,
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
  Future<bool> save() async {
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
      isLoading: true
    );

    try {
      return await savePowerBillUseCase.invoke(powerBill);
    } catch(error) {
      return false;
    } finally {
      uiState = AddPowerBillUIState(isLoading: false);
    }
  }
}
