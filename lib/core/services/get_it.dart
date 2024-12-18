import 'package:get_it/get_it.dart';
import 'package:note/core/services/database_helper.dart';
import 'package:note/features/home_features/provider/home_cubit.dart';

final getIt = GetIt.instance;

void getSetup() {
  getIt.registerSingleton<DatabaseHelper>(DatabaseHelper());
  getIt.registerSingleton<HomeCubit>(HomeCubit(getIt<DatabaseHelper>()));

}