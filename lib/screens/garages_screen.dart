import 'package:flutter/material.dart';

class GaragesScreen extends StatefulWidget {
  const GaragesScreen({super.key});

  @override
  State<StatefulWidget> createState() => GaragesScreenState();
}

class GaragesScreenState extends State<GaragesScreen> {
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
      appBar: AppBar(backgroundColor: Colors.lime, title: Text("Гаражи")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Text("Количество гаражей: $_counter"),
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
                      backgroundColor: WidgetStatePropertyAll(Colors.lime),
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
                      backgroundColor: WidgetStatePropertyAll(Colors.lime),
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
