import 'package:mobx/mobx.dart';
import 'package:pocket_note/domain/usecases/calculate_power_bill_usecase.dart';

part 'add_power_bill_store.g.dart';

class AddPowerBillStore = AddPowerBillBase with _$AddPowerBillStore;

abstract class AddPowerBillBase with Store {
  final CalculatePowerBillUseCase _calculatePowerBillUseCase;

  @observable
  double value = 0;

  AddPowerBillBase(this._calculatePowerBillUseCase);

  @action
  void setLastReading(String? lastReading) {}

  @action
  void setCurrentReading(String? currentReading) {}

  @action
  void setNeighborsTotalReading(String? neighborsTotalReading) {}

  @action
  void setNeighborsTotalValue(String? neighborsTotalReading) {}

  @action
  void save() {}
}
