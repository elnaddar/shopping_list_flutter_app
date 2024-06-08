import 'dart:ui';

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other
}

class Category {
  final String name;
  final Color color;

  const Category(this.name, this.color);

  @override
  String toString() {
    return "Category($name)";
  }
}
