import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pocket_note/domain/usecases/get_power_bills_use_case.dart';
import 'package:pocket_note/ui/screens/powerbills/power_bills_ui_state.dart';

import '../../../../domain/usecases/calculate_power_bill_usecase.dart';

part 'power_bills_store.g.dart';

@injectable
class PowerBillsStore = PowerBillsBase with _$PowerBillsStore;

abstract class PowerBillsBase with Store {
  final GetPowerBillsUseCase powerBillsUseCase;
  final CalculatePowerBillUseCase calculatePowerBillUseCase;

  PowerBillsBase(this.powerBillsUseCase, this.calculatePowerBillUseCase) {
    _load();
  }

  @observable
  PowerBillsUIState uiState = PowerBillsUIState(powerBills: null);

  _load() {
    powerBillsUseCase.invoke().then(
          (value) => uiState = PowerBillsUIState(
            powerBills:
                value.map((e) => calculatePowerBillUseCase.invoke(e)).toList(),
          ),
        );
  }

  @action
  reload() {
    _load();
  }
}
