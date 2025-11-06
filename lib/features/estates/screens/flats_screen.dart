import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/estates/models/estate_model.dart';
import 'package:flutter_app/features/estates/models/estate_store.dart';
import 'package:flutter_app/features/estates/widgets/estate_table.dart';

import 'cars_screen.dart';
import 'garages_screen.dart';
import 'houses_screen.dart';
import 'money_screen.dart';

class FlatsScreen extends StatefulWidget {
  final EstateStore estateStore;
  final Function(EstateModel) onAddEstate;
  final Function(int) onDeleteEstate;
  final Function(int) onEstateClick;

  const FlatsScreen({
    super.key,
    required this.estateStore,
    required this.onAddEstate,
    required this.onDeleteEstate,
    required this.onEstateClick,
  });

  final String tag = "flat";

  @override
  State<StatefulWidget> createState() => FlatsScreenState();
}

class FlatsScreenState extends State<FlatsScreen> {
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
        widget.onAddEstate(EstateModel.create(name, cost, widget.tag));
        _nameController.clear();
        _costController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void onCarScreen() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => CarsScreen(
            estateStore: widget.estateStore,
            onAddEstate: (estate) {
              widget.estateStore.add(estate);
            },
            onDeleteEstate: (estate) {
              widget.estateStore.remove(estate);
            },
            onEstateClick: (estate) {},
          ),
        ),
      );
    }

    void onFlatScreen() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => FlatsScreen(
            estateStore: widget.estateStore,
            onAddEstate: (estate) {
              widget.estateStore.add(estate);
            },
            onDeleteEstate: (estate) {
              widget.estateStore.remove(estate);
            },
            onEstateClick: (estate) {},
          ),
        ),
      );
    }

    void onHouseScreen() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HousesScreen(
            estateStore: widget.estateStore,
            onAddEstate: (estate) {
              widget.estateStore.add(estate);
            },
            onDeleteEstate: (estate) {
              widget.estateStore.remove(estate);
            },
            onEstateClick: (estate) {},
          ),
        ),
      );
    }

    void onGarageScreen() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GaragesScreen(
            estateStore: widget.estateStore,
            onAddEstate: (estate) {
              widget.estateStore.add(estate);
            },
            onDeleteEstate: (estate) {
              widget.estateStore.remove(estate);
            },
            onEstateClick: (estate) {},
          ),
        ),
      );
    }

    void onMoneyScreen() {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MoneyScreen(
            estateStore: widget.estateStore,
            onAddEstate: (estate) {
              widget.estateStore.add(estate);
            },
            onDeleteEstate: (estate) {
              widget.estateStore.remove(estate);
            },
            onEstateClick: (estate) {},
          ),
        ),
      );
    }
    return AnimatedBuilder(
      animation: widget.estateStore,
      builder: (context, _) {
        final flats = widget.estateStore.estates
            .where((estate) => estate.tag == widget.tag)
            .toList();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: Text("Квартиры"),
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
                      onPressed: onCarScreen,
                      child: Text("Машины"),
                    ),
                    TextButton(onPressed: onHouseScreen, child: Text("Дома")),
                    TextButton(
                      onPressed: onGarageScreen,
                      child: Text("Гаражи"),
                    ),
                    TextButton(onPressed: onMoneyScreen, child: Text("Деньги")),
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
                    onRemoveItem: widget.onDeleteEstate,
                    onItemClick: widget.onEstateClick,
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
