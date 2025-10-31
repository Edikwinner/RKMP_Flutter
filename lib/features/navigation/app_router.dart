import 'package:flutter_app/features/estates/models/estate_store.dart';
import 'package:flutter_app/features/estates/screens/cars_screen.dart';
import 'package:flutter_app/features/estates/screens/flats_screen.dart';
import 'package:flutter_app/features/estates/screens/houses_screen.dart';
import 'package:flutter_app/features/estates/screens/money_screen.dart';
import 'package:go_router/go_router.dart';

import '../estates/screens/garages_screen.dart';
import '../estates/screens/home_shell.dart';
import '../estates/screens/main_screen.dart';

GoRouter createRouter({required EstateStore estateStore}) {
  return GoRouter(
    refreshListenable: estateStore,
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MainScreen(
          estateStore: estateStore,
          onCar: () {
            context.go('/cars');
          },
          onFlat: () {
            context.go('/flats');
          },
          onHouse: () {
            context.go('/houses');
          },
          onGarage: () {
            context.go('/garages');
          },
          onMoney: () {
            context.go('/money');
          },
        ),
      ),

      ShellRoute(
        builder: (context, state, child) => HomeShell(child: child),
        routes: [
          GoRoute(
            path: '/cars',
            builder: (context, state) => CarsScreen(
              estateStore: estateStore,
              onBack: () {
                context.go('/');
              },
              onAddEstate: (estate) {
                estateStore.add(estate);
              },
              onDeleteEstate: (id) {
                estateStore.remove(id);
              },
              onEstateClick: (id) {},
            ),
          ),
          GoRoute(
            path: '/flats',
            builder: (context, state) => FlatsScreen(
              estateStore: estateStore,
              onBack: () {
                context.go('/');
              },
              onAddEstate: (estate) {
                estateStore.add(estate);
              },
              onDeleteEstate: (id) {
                estateStore.remove(id);
              },
              onEstateClick: (id) {},
            ),
          ),
          GoRoute(
            path: '/houses',
            builder: (context, state) => HousesScreen(
              estateStore: estateStore,
              onBack: () {
                context.go('/');
              },
              onAddEstate: (estate) {
                estateStore.add(estate);
              },
              onDeleteEstate: (id) {
                estateStore.remove(id);
              },
              onEstateClick: (id) {},
            ),
          ),
          GoRoute(
            path: '/garages',
            builder: (context, state) => GaragesScreen(
              estateStore: estateStore,
              onBack: () {
                context.go('/');
              },
              onAddEstate: (estate) {
                estateStore.add(estate);
              },
              onDeleteEstate: (id) {
                estateStore.remove(id);
              },
              onEstateClick: (id) {},
            ),
          ),
          GoRoute(
            path: '/money',
            builder: (context, state) => MoneyScreen(
              estateStore: estateStore,
              onBack: () {
                context.go('/');
              },
              onAddEstate: (estate) {
                estateStore.add(estate);
              },
              onDeleteEstate: (id) {
                estateStore.remove(id);
              },
              onEstateClick: (id) {},
            ),
          ),
        ],
      ),
    ],
  );
}
