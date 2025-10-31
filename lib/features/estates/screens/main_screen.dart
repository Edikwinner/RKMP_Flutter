import 'package:flutter/material.dart';
import 'package:flutter_app/features/estates/models/estate_store.dart';

class MainScreen extends StatelessWidget {
  final EstateStore estateStore;

  final Function() onCar;
  final Function() onFlat;
  final Function() onHouse;
  final Function() onGarage;
  final Function() onMoney;

  const MainScreen({
    super.key,
    required this.estateStore,
    required this.onCar,
    required this.onFlat,
    required this.onHouse,
    required this.onGarage,
    required this.onMoney,
  });

  @override
  Widget build(BuildContext context) {
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
                    onPressed: onCar,
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
                    onPressed: onFlat,
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
                    onPressed: onHouse,
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
                    onPressed: onGarage,
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
                    onPressed: onMoney,
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
