import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/features/estates/models/estate_model.dart';
import 'package:flutter_app/features/estates/models/estate_store.dart';
import 'package:flutter_app/features/estates/widgets/estate_table.dart';

import 'cars_screen.dart';
import 'flats_screen.dart';
import 'garages_screen.dart';
import 'houses_screen.dart';

class MoneyScreen extends StatefulWidget {
  final EstateStore estateStore;
  final Function(EstateModel) onAddEstate;
  final Function(int) onDeleteEstate;
  final Function(int) onEstateClick;

  const MoneyScreen({
    super.key,
    required this.estateStore,
    required this.onAddEstate,
    required this.onDeleteEstate,
    required this.onEstateClick,
  });

  final String tag = "money";

  @override
  State<StatefulWidget> createState() => MoneyScreenState();
}

class MoneyScreenState extends State<MoneyScreen> {
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
        widget.onAddEstate(EstateModel.create("", cost, widget.tag));
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
        final money = widget.estateStore.estates
            .where((estate) => estate.tag == widget.tag)
            .toList();
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.green, title: Text("Деньги")),
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
                    TextButton(onPressed: onFlatScreen, child: Text("Квартиры")),
                    TextButton(
                      onPressed: onHouseScreen,
                      child: Text("Дома"),
                    ),
                    TextButton(onPressed: onGarageScreen, child: Text("Гаражи")),
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
