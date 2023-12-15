import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pocket_note/core/extensions/string_ext.dart';
import 'package:pocket_note/domain/models/power_bill.dart';

import '../../../../domain/usecases/save_power_bill_usecase.dart';

part 'add_power_bill_store.g.dart';

@injectable
class AddPowerBillStore = AddPowerBillBase with _$AddPowerBillStore;

abstract class AddPowerBillBase with Store {
  String? _lastReading;
  String? _currentReading;
  String? _neighborsTotalReading;
  String? _neighborsTotalValue;

  @observable
  String date = "";

  @observable
  bool? success;

  final SavePowerBillUseCase savePowerBillUseCase;

  AddPowerBillBase(this.savePowerBillUseCase);

  @action
  void setLastReading(String? lastReading) {
    _lastReading = lastReading;
  }

  @action
  void setCurrentReading(String? currentReading) {
    _currentReading = currentReading;
  }

  @action
  void setNeighborsTotalReading(String? neighborsTotalReading) {
    _neighborsTotalReading = neighborsTotalReading;
  }

  @action
  void setNeighborsTotalValue(String? neighborsTotalValue) {
    _neighborsTotalValue = neighborsTotalValue;
  }

  @action
  void save() {
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
    savePowerBillUseCase
        .invoke(powerBill)
        .then((value) => _onSaveSuccess(value));
  }

  _onSaveSuccess(bool value) {

    success = value;
  }
}
