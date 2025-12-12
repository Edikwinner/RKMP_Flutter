import 'package:flutter_app/features/cars/cars_screen.dart';
import 'package:flutter_app/features/flats/flats_screen.dart';
import 'package:flutter_app/features/garages/garages_screen.dart';
import 'package:flutter_app/features/houses/houses_screen.dart';
import 'package:flutter_app/features/lands/lands_screen.dart';
import 'package:flutter_app/features/money/money_screen.dart';
import 'package:flutter_app/features/motocycles/motocycles_screen.dart';
import 'package:go_router/go_router.dart';

import '../../app/main_screen.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => MainScreen()),

      GoRoute(path: '/cars', builder: (context, state) => CarsScreen()),

      GoRoute(path: '/flats', builder: (context, state) => FlatsScreen()),

      GoRoute(path: '/houses', builder: (context, state) => HousesScreen()),

      GoRoute(path: '/garages', builder: (context, state) => GaragesScreen()),

      GoRoute(path: '/money', builder: (context, state) => MoneyScreen()),

      GoRoute(path: '/motocycles', builder: (context, state) => MotocyclesScreen()),

      GoRoute(path: '/lands', builder: (context, state) => LandsScreen()),
    ],
  );
}
