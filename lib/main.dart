import 'package:flutter/material.dart';
import 'package:flutter_app/features/estates/screens/main_screen.dart';

import 'features/estates/models/estate_store.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final EstateStore estateStore = EstateStore();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Учет собственности',
      home: MainScreen(estateStore: estateStore),
    );
  }
}
