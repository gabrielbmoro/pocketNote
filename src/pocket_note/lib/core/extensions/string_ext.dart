extension NumberParsing on String {
  double? parseToDouble() {
    return double.tryParse(this);
  }
}
