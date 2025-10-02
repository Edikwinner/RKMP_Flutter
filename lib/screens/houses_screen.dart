import 'package:flutter/material.dart';

class HousesScreen extends StatefulWidget {
  const HousesScreen({super.key});

  @override
  State<StatefulWidget> createState() => HousesScreenState();
}

class HousesScreenState extends State<HousesScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.amber, title: Text("Дома")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Text("Количество домов: $_counter"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.all(16),
                  child: FilledButton(
                    onPressed: () {
                      _decrementCounter();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.amber),
                    ),
                    child: Text("-"),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsGeometry.all(16),
                  child: FilledButton(
                    onPressed: () {
                      _incrementCounter();
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.amber),
                    ),
                    child: Text("+"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
