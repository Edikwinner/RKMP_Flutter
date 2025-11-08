import 'package:flutter/foundation.dart';

import 'estate_model.dart';

class EstateStore extends ChangeNotifier {
  final List<EstateModel> _estates = [];

  List<EstateModel> get estates => List.unmodifiable(_estates);

  void add(EstateModel e) {
    _estates.add(e);
    notifyListeners();
  }

  void remove(int id) {
    _estates.removeWhere((e) => e.id == id);
    notifyListeners();
  }

  void onClick(int id) {}
}
