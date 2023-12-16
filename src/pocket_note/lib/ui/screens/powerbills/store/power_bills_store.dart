import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pocket_note/domain/usecases/get_power_bills_use_case.dart';
import 'package:pocket_note/ui/screens/powerbills/power_bills_ui_state.dart';

part 'power_bills_store.g.dart';

@injectable
class PowerBillsStore = PowerBillsBase with _$PowerBillsStore;

abstract class PowerBillsBase with Store {
  final GetPowerBillsUseCase powerBillsUseCase;

  PowerBillsBase(this.powerBillsUseCase) {
    powerBillsUseCase
        .invoke()
        .then((value) => uiState = PowerBillsUIState(powerBills: value));
  }

  @observable
  PowerBillsUIState uiState = PowerBillsUIState(powerBills: null);
}
