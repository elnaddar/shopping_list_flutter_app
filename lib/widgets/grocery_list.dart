import 'package:flutter/material.dart';
import 'package:shopping_list_flutter_app/data/dummy_items.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Groceries")),
      body: ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          return ListTile(
            leading: SizedBox(
              height: 20,
              width: 20,
              child: ColoredBox(color: item.category.color),
            ),
            title: Text(item.name),
            trailing: Text(item.quantity.toString()),
          );
        },
      ),
    );
  }
}
