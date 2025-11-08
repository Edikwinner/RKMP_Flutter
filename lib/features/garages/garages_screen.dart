import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/estate_provider.dart';
import '../../core/models/estate_model.dart';
import '../../core/widgets/estate_table.dart';


class GaragesScreen extends StatefulWidget {
  final String tag = "garage";

  const GaragesScreen({super.key});

  @override
  State<StatefulWidget> createState() => GaragesScreenState();
}

class GaragesScreenState extends State<GaragesScreen> {
  late final estateStore = EstateProvider.of(context).estateStore;

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
        estateStore.add(EstateModel.create(name, cost, widget.tag));
        _nameController.clear();
        _costController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: estateStore,
      builder: (context, _) {
        final garages = estateStore.estates
            .where((estate) => estate.tag == widget.tag)
            .toList();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.lime,
            title: Text("Гаражи"),
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
                        context.pushReplacement("/houses");
                      },
                      child: Text("Дома"),
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
                                  color: Colors.lime,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.lime,
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
                                    "Введите примерную стоимость гаража (₽)",
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.lime,
                                    width: 2,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.lime,
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
                    estateList: garages,
                    onRemoveItem: estateStore.remove,
                    onItemClick: estateStore.onClick,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
