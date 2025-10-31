import 'package:flutter/material.dart';
import 'package:flutter_app/features/estates/models/estate_store.dart';

import '../estates/screens/home_shell.dart';
import '../estates/screens/main_screen.dart';

class AppNavigation extends StatelessWidget {
  final EstateStore estateStore;

  const AppNavigation({super.key, required this.estateStore});

  void _openSection(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            HomeShell(estateStore: estateStore, initialIndex: index),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      estateStore: estateStore,
      onCar: () => _openSection(context, 0),
      onFlat: () => _openSection(context, 1),
      onHouse: () => _openSection(context, 2),
      onGarage: () => _openSection(context, 3),
      onMoney: () => _openSection(context, 4),
    );
  }
}
