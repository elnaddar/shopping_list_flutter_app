import 'package:flutter/material.dart';
import 'package:shopping_list_flutter_app/data/dummy_items.dart';
import 'package:shopping_list_flutter_app/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void _addItem() => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const NewItem(),
      ));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(onPressed: _addItem, icon: const Icon(Icons.add)),
        ],
      ),
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
