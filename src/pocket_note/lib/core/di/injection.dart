import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pocket_note/core/di/injection.config.dart';
import 'package:pocket_note/data/local_data_source.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: "init")
Future<void> configureDependencies() async {
  getIt.init();

  final localDataSource = getIt<LocalDataSource>();
  await localDataSource.init();
}
