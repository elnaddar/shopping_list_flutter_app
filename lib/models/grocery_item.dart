import 'category.dart';

class GroceryItem {
  final String id;
  final String name;
  final int quantity;
  final Category category;

  const GroceryItem(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.category});

  factory GroceryItem.fromFormMap(Map<String, dynamic> map) {
    return GroceryItem(
      id: DateTime.now().toString(),
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      category: map['category'] as Category,
    );
  }
}
