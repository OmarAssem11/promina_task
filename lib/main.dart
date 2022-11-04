import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:promina_task/core/presentation/bloc/app_bloc_observer.dart';
import 'package:promina_task/core/presentation/resources/routes_manager.dart';
import 'package:promina_task/core/presentation/resources/theme_manager.dart';
import 'package:promina_task/di/injector.dart';
import 'package:promina_task/generated/l10n.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hashtag',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoute,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
    );
  }
}
