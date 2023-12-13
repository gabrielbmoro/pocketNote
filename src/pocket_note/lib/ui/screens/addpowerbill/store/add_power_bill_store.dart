import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:pocket_note/domain/usecases/calculate_power_bill_usecase.dart';
import 'package:pocket_note/ui/screens/addpowerbill/add_power_bill_ui_state.dart';

part 'add_power_bill_store.g.dart';

class AddPowerBillStore = AddPowerBillBase with _$AddPowerBillStore;

abstract class AddPowerBillBase with Store {

  String? _lastReading;
  String? _currentReading;
  String? _neighborsTotalReading;
  String? _neighborsTotalValue;

  @observable
  AddPowerBillUIState uiState = AddPowerBillUIState(
    error: null,
    isLoading: false,
  );

  AddPowerBillBase();

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
  void save() {}
}
