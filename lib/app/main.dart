import 'package:flutter/material.dart';

import '../core/di/estate_provider.dart';
import '../core/models/estate_store.dart';
import '../core/navigation/app_router.dart';

void main() {
  setupProvider();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late final router = createRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Учет собственности',
      routerConfig: router,
    );
  }
}
