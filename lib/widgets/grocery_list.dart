import 'package:flutter/material.dart';
import 'package:shopping_list_flutter_app/models/grocery_item.dart';
import 'package:shopping_list_flutter_app/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _itemsList = [];
  void _addItem() async {
    final newItem =
        await Navigator.of(context).push<GroceryItem>(MaterialPageRoute(
      builder: (context) => const NewItem(),
    ));

    if (newItem == null) {
      return;
    }

    setState(() {
      _itemsList.add(newItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [
          IconButton(onPressed: _addItem, icon: const Icon(Icons.add)),
        ],
      ),
      body: _itemsList.isNotEmpty
          ? ListView.builder(
              itemCount: _itemsList.length,
              itemBuilder: (context, index) {
                final item = _itemsList[index];
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
            )
          : const Center(child: Text("No Items in the list, try to add some.")),
    );
  }
}
