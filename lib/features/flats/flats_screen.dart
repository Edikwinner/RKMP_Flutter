import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/models/estate_model.dart';
import '../../core/models/estate_store.dart';
import '../../core/widgets/estate_table.dart';

class FlatsScreen extends ConsumerStatefulWidget {
  final String tag = "flat";

  const FlatsScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => FlatsScreenState();
}

class FlatsScreenState extends ConsumerState<FlatsScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _nameErrorText;

  final TextEditingController _costController = TextEditingController();
  String? _costErrorText;

  void _checkAndAdd() {
    final name = _nameController.text.trim();
    final costText = _costController.text.trim();
    final cost = int.tryParse(costText);

    setState(() {
      _nameErrorText = null;
      _costErrorText = null;

      if (name.isEmpty) {
        _nameErrorText = "Введите название";
      }
      if (costText.isEmpty) {
        _costErrorText = "Введите стоимость";
      } else if (cost == null) {
        _costErrorText = "Некорректный ввод";
      }

      if (_nameErrorText == null && _costErrorText == null && cost != null) {
        ref
            .read(estateStoreProvider.notifier)
            .add(EstateModel.create(name, cost, widget.tag));
        _nameController.clear();
        _costController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final flats = ref
        .watch(estateStoreProvider)
        .where((estate) => estate.tag == widget.tag)
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Квартиры"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go("/");
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    context.pushReplacement("/cars");
                  },
                  child: Text("Машины", style: TextStyle(color: Colors.red),),
                ),
                TextButton(
                  onPressed: () {
                    context.pushReplacement("/houses");
                  },
                  child: Text("Дома", style: TextStyle(color: Colors.amber)),
                ),
                TextButton(
                  onPressed: () {
                    context.pushReplacement("/garages");
                  },
                  child: Text("Гаражи", style: TextStyle(color: Colors.green)),
                ),
                TextButton(
                  onPressed: () {
                    context.pushReplacement("/money");
                  },
                  child: Text("Деньги", style: TextStyle(color: Colors.lightBlueAccent)),
                ),
                TextButton(
                  onPressed: () {
                    context.pushReplacement("/lands");
                  },
                  child: Text("Земли", style: TextStyle(color: Colors.blueAccent)),
                ),
                TextButton(
                  onPressed: () {
                    context.pushReplacement("/motocycles");
                  },
                  child: Text("Мотоциклы", style: TextStyle(color: Colors.purple)),
                ),
              ],
            ),

            SizedBox(height: 8),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          hintText: "Введите название",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.orange,
                              width: 1,
                            ),
                          ),
                          errorText: _nameErrorText,
                        ),
                      ),

                      SizedBox(height: 8),

                      Center(
                        child: TextField(
                          controller: _costController,
                          decoration: InputDecoration(
                            hintText:
                                "Введите примерную стоимость квартиры (₽)",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.orange,
                                width: 1,
                              ),
                            ),
                            errorText: _costErrorText,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(width: 8),

                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _checkAndAdd();
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            Expanded(
              child: EstateTable(
                estateList: flats,
                onRemoveItem: (id) =>
                    ref.read(estateStoreProvider.notifier).remove(id),
                onItemClick: (id) =>
                    ref.read(estateStoreProvider.notifier).onClick(id),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
