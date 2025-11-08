import 'package:flutter/material.dart';

import '../models/estate_store.dart';



class EstateProvider extends InheritedWidget {
  final EstateStore estateStore;

  const EstateProvider({
    required this.estateStore,
    required super.child,
    super.key,
  });

  static EstateProvider of(BuildContext context) {
    final EstateProvider? result = context
        .dependOnInheritedWidgetOfExactType<EstateProvider>();
    return result!;
  }

  @override
  bool updateShouldNotify(EstateProvider oldWidget) =>
      estateStore != oldWidget.estateStore;
}
