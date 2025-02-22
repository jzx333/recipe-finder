class IngredientEntity {
  final String name;
  final String quantity;

  const IngredientEntity({
    required this.name,
    required this.quantity,
  });

  @override
  String toString() {
    return 'IngredientEntity{name: $name, quantity: $quantity}';
  }
}