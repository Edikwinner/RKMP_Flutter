import 'package:get_it/get_it.dart';
import '../models/estate_store.dart';

final getIt = GetIt.instance;

void setupProvider() {
  getIt.registerLazySingleton<EstateStore>(() => EstateStore());
}