class AddPowerBillUIState {
  ResultType? resultType;

  AddPowerBillUIState({
    required this.resultType,
  });
}

enum ResultType {
  success,
  error,
  loading;
}
