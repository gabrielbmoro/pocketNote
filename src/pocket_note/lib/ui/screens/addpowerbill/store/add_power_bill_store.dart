import 'package:mobx/mobx.dart';

import '../../../../domain/usecases/save_power_bill_usecase.dart';

part 'add_power_bill_store.g.dart';

class AddPowerBillStore = AddPowerBillBase with _$AddPowerBillStore;

abstract class AddPowerBillBase with Store {
  String? _lastReading;
  String? _currentReading;
  String? _neighborsTotalReading;
  String? _neighborsTotalValue;

  @observable
  String date = "";

  final SavePowerBillUseCase savePowerBillUseCase;

  AddPowerBillBase(this.savePowerBillUseCase);

  @action
  void setLastReading(String? lastReading) {
    _lastReading = lastReading;
    date = "$_lastReading";
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
  void save() {}
}
