import 'package:flutter/material.dart';

import 'features/estates/models/estate_store.dart';
import 'features/navigation/app_router.dart';

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

  late final router = createRouter(estateStore: estateStore);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Учет собственности',
      routerConfig: router,
    );
  }
}
