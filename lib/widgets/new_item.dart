import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_list_flutter_app/data/categories.dart';
import 'package:shopping_list_flutter_app/models/category.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formNamesAndValues = {
    'category': categories[Categories.vegetables]
  };

  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  void _onSaved(String name, dynamic value) {
    _formNamesAndValues[name] = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Name"),
                  errorMaxLines: 3,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.trim().isEmpty) {
                    return "This field is required and cannot be empty or be only white spaces.";
                  } else if (value.trim().length <= 1) {
                    return "This field must have atleast 2 characters.";
                  }
                  return null;
                },
                onSaved: (newValue) => _onSaved("name", newValue),
              ),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text("Quantity"),
                        errorMaxLines: 3,
                      ),
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.trim().isEmpty ||
                            int.tryParse(value) == null) {
                          return "This field is required and cannot be empty.";
                        } else if (int.tryParse(value)! <= 0) {
                          return "Quantity must be 1 or more.";
                        }
                        return null;
                      },
                      onSaved: (newValue) =>
                          _onSaved("quantity", int.parse(newValue!)),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 3,
                    child: DropdownButtonFormField(
                      value: _formNamesAndValues["category"],
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
                      onSaved: (newValue) => _onSaved("category", newValue),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => _formKey.currentState!.reset(),
                    child: const Text("Reset"),
                  ),
                  const SizedBox(width: 6),
                  ElevatedButton(
                    onPressed: _saveItem,
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
