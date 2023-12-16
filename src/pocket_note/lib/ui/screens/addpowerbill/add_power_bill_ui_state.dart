class AddPowerBillUIState {
  ResultType? resultType;
  String date = "";

  AddPowerBillUIState({
    required this.resultType,
    required this.date,
  });
}

enum ResultType {
  success,
  error,
  loading;
}
