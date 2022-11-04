import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:promina_task/di/injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() => $initGetIt(getIt);
