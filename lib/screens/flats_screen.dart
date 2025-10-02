import 'package:flutter/material.dart';

class FlatsScreen extends StatefulWidget {
  const FlatsScreen({super.key});

  @override
  State<StatefulWidget> createState() => FlatsScreenState();
}

class FlatsScreenState extends State<FlatsScreen> {
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
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Квартиры"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Text("Количество квартир: $_counter"),
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
                      backgroundColor: WidgetStatePropertyAll(Colors.orange),
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
                      backgroundColor: WidgetStatePropertyAll(Colors.orange),
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
