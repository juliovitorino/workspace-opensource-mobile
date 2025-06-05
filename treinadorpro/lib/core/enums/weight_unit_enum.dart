enum WeightUnit { kg, lbs, plate }

extension WeightUnitExtension on WeightUnit {
  String get unit {
    switch (this) {
      case WeightUnit.kg:
        return 'Kg';
      case WeightUnit.lbs:
        return 'Lbs';
      case WeightUnit.plate:
        return 'Placas';
    }
  }
}
