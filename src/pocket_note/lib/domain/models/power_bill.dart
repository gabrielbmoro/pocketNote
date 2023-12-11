import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PowerBill extends Equatable {
  double lastReadingInKWm;

  double currentReadingInKWm;

  double neighborsTotalReadingInKWm;

  double neighborsTotalValue;

  String? finalValue;

  PowerBill({
    required this.lastReadingInKWm,
    required this.currentReadingInKWm,
    required this.neighborsTotalReadingInKWm,
    required this.neighborsTotalValue,
  });

  @override
  List<Object?> get props => [
        lastReadingInKWm,
        currentReadingInKWm,
        neighborsTotalReadingInKWm,
        neighborsTotalValue
      ];
}
