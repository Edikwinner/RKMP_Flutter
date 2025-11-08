import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/di/estate_provider.dart';
import '../../core/models/estate_model.dart';
import '../../core/widgets/estate_table.dart';


class MoneyScreen extends StatefulWidget {
  final String tag = "money";

  const MoneyScreen({super.key});

  @override
  State<StatefulWidget> createState() => MoneyScreenState();
}

class MoneyScreenState extends State<MoneyScreen> {
  late final estateStore = EstateProvider.of(context).estateStore;

  final TextEditingController _costController = TextEditingController();
  String? _costErrorText;

  void _checkAndAdd() {
    final costText = _costController.text.trim();
    final cost = int.tryParse(costText);

    setState(() {
      _costErrorText = null;

      if (costText.isEmpty) {
        _costErrorText = "Введите стоимость";
      } else if (cost == null) {
        _costErrorText = "Некорректный ввод";
      }

      if (_costErrorText == null && cost != null) {
        estateStore.add(EstateModel.create("", cost, widget.tag));
        _costController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: estateStore,
      builder: (context, _) {
        final money = estateStore.estates
            .where((estate) => estate.tag == widget.tag)
            .toList();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text("Деньги"),
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
                        context.pushReplacement("/garages");
                      },
                      child: Text("Гаражи"),
                    ),
                  ],
                ),

                SizedBox(height: 8),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _costController,
                        decoration: InputDecoration(
                          hintText: "Введите количество денег (₽)",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.green,
                              width: 1,
                            ),
                          ),
                          errorText: _costErrorText,
                        ),
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
                    estateList: money,
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
