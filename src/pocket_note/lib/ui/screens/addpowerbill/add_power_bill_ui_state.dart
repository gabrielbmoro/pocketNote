
class AddPowerBillUIState {
  bool isLoading = false;
  String? errorMessage;
  String? successMessage;
  String date = "";

  AddPowerBillUIState(
      {required this.isLoading,
      required this.errorMessage,
      required this.successMessage,
      required this.date});
}
