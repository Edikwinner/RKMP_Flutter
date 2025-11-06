import 'package:flutter/material.dart';
import 'package:flutter_app/features/estates/models/estate_store.dart';

import 'cars_screen.dart';
import 'flats_screen.dart';
import 'garages_screen.dart';
import 'houses_screen.dart';
import 'money_screen.dart';

class MainScreen extends StatelessWidget {
  final EstateStore estateStore;

  const MainScreen({super.key, required this.estateStore});

  @override
  Widget build(BuildContext context) {
    void onCarScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CarsScreen(
            estateStore: estateStore,
            onAddEstate: (estate) {
              estateStore.add(estate);
            },
            onDeleteEstate: (estate) {
              estateStore.remove(estate);
            },
            onEstateClick: (estate) {},
          ),
        ),
      );
    }

    void onFlatScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FlatsScreen(
            estateStore: estateStore,
            onAddEstate: (estate) {
              estateStore.add(estate);
            },
            onDeleteEstate: (estate) {
              estateStore.remove(estate);
            },
            onEstateClick: (estate) {},
          ),
        ),
      );
    }

    void onHouseScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HousesScreen(
            estateStore: estateStore,
            onAddEstate: (estate) {
              estateStore.add(estate);
            },
            onDeleteEstate: (estate) {
              estateStore.remove(estate);
            },
            onEstateClick: (estate) {},
          ),
        ),
      );
    }

    void onGarageScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => GaragesScreen(
            estateStore: estateStore,
            onAddEstate: (estate) {
              estateStore.add(estate);
            },
            onDeleteEstate: (estate) {
              estateStore.remove(estate);
            },
            onEstateClick: (estate) {},
          ),
        ),
      );
    }

    void onMoneyScreen() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MoneyScreen(
            estateStore: estateStore,
            onAddEstate: (estate) {
              estateStore.add(estate);
            },
            onDeleteEstate: (estate) {
              estateStore.remove(estate);
            },
            onEstateClick: (estate) {},
          ),
        ),
      );
    }

    return AnimatedBuilder(
      animation: estateStore,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text("Учет собственности"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 8),
                  child: Text(
                    "Павлов Эдуард Вадимович",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 8),
                  child: Text(
                    'ИКБО-06-22',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 16),
                  child: Text('22И1754', style: TextStyle(color: Colors.black)),
                ),

                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 16),
                  child: Text(
                    'Общая стоимость собственности: ${estateStore.estates.fold(0, (sum, item) => sum + item.cost)} ₽',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 16),
                  child: FilledButton(
                    onPressed: onCarScreen,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    child: Text("Машины"),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 16),
                  child: FilledButton(
                    onPressed: onFlatScreen,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.orange),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    child: Text("Квартиры"),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 16),
                  child: FilledButton(
                    onPressed: onHouseScreen,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.amber),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    child: Text("Дома"),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 16),
                  child: FilledButton(
                    onPressed: onGarageScreen,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.lime),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    child: Text("Гаражи"),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.only(bottom: 16),
                  child: FilledButton(
                    onPressed: onMoneyScreen,
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      ),
                    ),
                    child: Text("Деньги"),
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
