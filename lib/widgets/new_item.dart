import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping_list_flutter_app/data/categories.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Name"),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.trim().isEmpty) {
                    return "This field is required and cannot be empty or be only white spaces.";
                  } else if (value.trim().length <= 1) {
                    return "This field must have atleast 2 characters.";
                  }
                  return null;
                },
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Quantity"),
                      ),
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().isEmpty ||
                            int.tryParse(value) == null) {
                          return "This field is required and cannot be empty, be only white spaces, or have any character.";
                        } else if (int.tryParse(value)! <= 0) {
                          return "Quantity must be 1 or more.";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 3,
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Category"),
                      ),
                      items: [
                        for (final cat in categories.entries)
                          DropdownMenuItem(
                            value: cat.value,
                            child: Row(
                              children: [
                                SizedBox.square(
                                  dimension: 16,
                                  child: ColoredBox(color: cat.value.color),
                                ),
                                const SizedBox(width: 6),
                                Text(cat.value.name)
                              ],
                            ),
                          )
                      ],
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text("Reset"),
                  ),
                  const SizedBox(width: 6),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Add Item"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
