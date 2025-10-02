import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .primary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: Text(
                "Павлов Эдуард Вадимович",
                style: TextStyle(color: Colors.green),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: Text(
                  'ИКБО-06-22',
                  style: TextStyle(color: Colors.green)
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: Text(
                '22И1754',
                style: TextStyle(color: Colors.green),
              ),
            ),
            FilledButton(
              onPressed: () {  },
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                  shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)
                      )
                  )
              ),
              child: Text("Click me"),
            )
          ],
        )
      )
    );
  }
}