import 'package:equatable/equatable.dart';

class AddPowerBillUIState extends Equatable {
  bool isLoading = false;
  String? error;

  AddPowerBillUIState({required isLoading, required error});

  @override
  List<Object?> get props => [isLoading, error];
}
