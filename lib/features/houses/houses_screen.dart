import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/models/estate_model.dart';
import '../../core/models/estate_store.dart';
import '../../core/widgets/estate_table.dart';

class HousesScreen extends ConsumerStatefulWidget {
  final String tag = "house";

  const HousesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HousesScreenState();
}

class HousesScreenState extends ConsumerState<HousesScreen> {
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
    final houses = ref
        .watch(estateStoreProvider)
        .where((estate) => estate.tag == widget.tag)
        .toList();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Дома"),
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
                  child: Text("Машины"),
                ),
                TextButton(
                  onPressed: () {
                    context.pushReplacement("/flats");
                  },
                  child: Text("Квартиры"),
                ),
                TextButton(
                  onPressed: () {
                    context.pushReplacement("/garages");
                  },
                  child: Text("Гаражи"),
                ),
                TextButton(
                  onPressed: () {
                    context.pushReplacement("/money");
                  },
                  child: Text("Деньги"),
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
                              color: Colors.amber,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.amber,
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
                            hintText: "Введите примерную стоимость дома (₽)",
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.amber,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.amber,
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
                estateList: houses,
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
