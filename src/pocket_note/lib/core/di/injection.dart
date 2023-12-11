import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pocket_note/core/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: "init")
void configureDependencies() => getIt.init();
