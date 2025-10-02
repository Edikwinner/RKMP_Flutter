import 'package:flutter/material.dart';
import 'package:flutter_app/screens/cars_screen.dart';
import 'package:flutter_app/screens/flats_screen.dart';
import 'package:flutter_app/screens/garages_screen.dart';
import 'package:flutter_app/screens/houses_screen.dart';
import 'package:flutter_app/screens/money_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: Text(
                "Павлов Эдуард Вадимович",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: Text('ИКБО-06-22', style: TextStyle(color: Colors.black)),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: Text('22И1754', style: TextStyle(color: Colors.black)),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: FilledButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CarsScreen()),
                  );
                },
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FlatsScreen()),
                  );
                },
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HousesScreen()),
                  );
                },
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GaragesScreen()),
                  );
                },
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MoneyScreen()),
                  );
                },
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
  }
}
