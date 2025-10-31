import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeShell extends StatefulWidget {
  final Widget child;

  const HomeShell({super.key, required this.child});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  static const _tabs = ['/cars', '/flats', '/houses', '/garages', '/money'];

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final index = _tabs.indexWhere((tab) => location.startsWith(tab));
    return index >= 0 ? index : 0;
  }

  void _onTap(int index) {
    if (index != _getCurrentIndex(context)) {
      context.go(_tabs[index]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentIndex = _getCurrentIndex(context);

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
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
