import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_task/di/injector.dart';
import 'package:promina_task/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:promina_task/features/auth/presentation/screens/login_screen.dart';
import 'package:promina_task/features/auth/presentation/screens/starter_screen.dart';
import 'package:promina_task/features/gallery/presentation/cubit/gallery_cubit.dart';
import 'package:promina_task/features/gallery/presentation/screens/gallery_screen.dart';
import 'package:promina_task/generated/l10n.dart';

class AppRoutes {
  static const String starter = '/';
  static const String login = '/login';
  static const String gallery = '/gallery';
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.starter:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<AuthCubit>(),
          child: const StarterScreen(),
        ),
      );
    case AppRoutes.login:
      return MaterialPageRoute(
        builder: (_) => BlocProvider(
          create: (_) => getIt<AuthCubit>(),
          child: const LoginScreen(),
        ),
      );
    case AppRoutes.gallery:
      return MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => getIt<AuthCubit>(),
            ),
            BlocProvider(
              create: (_) => getIt<GalleryCubit>(),
            ),
          ],
          child: const GalleryScreen(),
        ),
      );
    default:
      return undefinedRoute();
  }
}

Route<dynamic> undefinedRoute() => MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(S.current.noPageFound),
        ),
      ),
    );
