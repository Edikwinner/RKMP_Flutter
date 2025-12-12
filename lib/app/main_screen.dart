import 'package:flutter/material.dart';
import 'package:flutter_app/core/models/estate_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Учет собственности"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 8),
              child: Text(
                "Павлов Эдуард Вадимович",
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 8),
              child: Text('ИКБО-06-22', style: TextStyle(color: Colors.black)),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: Text('22И1754', style: TextStyle(color: Colors.black)),
            ),

            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: Text(
                'Общая стоимость собственности: ${ref.watch(estateStoreProvider).fold(0, (sum, item) => sum + item.cost)} ₽',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: FilledButton(
                onPressed: () {
                  context.go("/cars");
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.red),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                child: Text("Машины"),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: FilledButton(
                onPressed: () {
                  context.go("/flats");
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.orange),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                child: Text("Квартиры"),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: FilledButton(
                onPressed: () {
                  context.go("/houses");
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.amber),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                child: Text("Дома"),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: FilledButton(
                onPressed: () {
                  context.go("/garages");
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.green),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                child: Text("Гаражи"),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: FilledButton(
                onPressed: () {
                  context.go("/money");
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.lightBlueAccent),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                child: Text("Деньги"),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: FilledButton(
                onPressed: () {
                  context.go("/lands");
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                child: Text("Земли"),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.only(bottom: 16),
              child: FilledButton(
                onPressed: () {
                  context.go("/motocycles");
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.purple),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                ),
                child: Text("Мотоциклы"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
