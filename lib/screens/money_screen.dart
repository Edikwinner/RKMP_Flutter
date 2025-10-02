import 'package:flutter/material.dart';

class MoneyScreen extends StatefulWidget {
  const MoneyScreen({super.key});

  @override
  State<StatefulWidget> createState() => MoneyScreenState();
}

class MoneyScreenState extends State<MoneyScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 10000;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter -= 10000;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text("Деньги")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: Text("Количество денег: $_counter ₽"),
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
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
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
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
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
