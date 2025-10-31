import 'package:flutter/material.dart';
import 'package:flutter_app/features/estates/models/estate_store.dart';
import 'package:flutter_app/features/estates/screens/cars_screen.dart';
import 'package:flutter_app/features/estates/screens/flats_screen.dart';
import 'package:flutter_app/features/estates/screens/garages_screen.dart';
import 'package:flutter_app/features/estates/screens/houses_screen.dart';
import 'package:flutter_app/features/estates/screens/money_screen.dart';

class HomeShell extends StatefulWidget {
  final EstateStore estateStore;
  final int initialIndex;

  const HomeShell({
    super.key,
    required this.estateStore,
    required this.initialIndex,
  });

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  late final int _currentIndex = widget.initialIndex;

  Widget _buildScreen(int index) {
    switch (index) {
      case 0:
        return CarsScreen(
          estateStore: widget.estateStore,
          onAddEstate: (e) => widget.estateStore.add(e),
          onDeleteEstate: (id) => widget.estateStore.remove(id),
          onEstateClick: (id) {},
        );
      case 1:
        return FlatsScreen(
          estateStore: widget.estateStore,
          onAddEstate: (e) => widget.estateStore.add(e),
          onDeleteEstate: (id) => widget.estateStore.remove(id),
          onEstateClick: (id) {},
        );
      case 2:
        return HousesScreen(
          estateStore: widget.estateStore,
          onAddEstate: (e) => widget.estateStore.add(e),
          onDeleteEstate: (id) => widget.estateStore.remove(id),
          onEstateClick: (id) {},
        );
      case 3:
        return GaragesScreen(
          estateStore: widget.estateStore,
          onAddEstate: (e) => widget.estateStore.add(e),
          onDeleteEstate: (id) => widget.estateStore.remove(id),
          onEstateClick: (id) {},
        );
      case 4:
      default:
        return MoneyScreen(
          estateStore: widget.estateStore,
          onAddEstate: (e) => widget.estateStore.add(e),
          onDeleteEstate: (id) => widget.estateStore.remove(id),
          onEstateClick: (id) {},
        );
    }
  }

  void _onTabSelected(int index) {
    if (index == _currentIndex) return;

    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (_, __, ___) =>
            HomeShell(estateStore: widget.estateStore, initialIndex: index),
        transitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabSelected,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car_filled),
            label: 'Машины',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work),
            label: 'Квартиры',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Дома'),
          BottomNavigationBarItem(icon: Icon(Icons.garage), label: 'Гаражи'),
          BottomNavigationBarItem(icon: Icon(Icons.money), label: 'Деньги'),
        ],
      ),
    );
  }
}
