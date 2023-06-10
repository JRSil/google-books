extension DoubleExtension on double {
  String toMoney() => "R\$ ${toStringAsFixed(2)}";
}
