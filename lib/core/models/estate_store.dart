import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'estate_model.dart';

part 'estate_store.g.dart';

@riverpod
class EstateStore extends _$EstateStore {
  @override
  List<EstateModel> build() {
    return [];
  }

  void add(EstateModel e) {
    state = [...state, e];
  }

  void remove(int id) {
    state = state.where((e) => e.id != id).toList();
  }

  void onClick(int id) {
  }
}
