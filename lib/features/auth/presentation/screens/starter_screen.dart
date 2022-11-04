import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_task/core/presentation/resources/routes_manager.dart';
import 'package:promina_task/core/presentation/util/toast.dart';
import 'package:promina_task/core/presentation/widgets/loading_indicator.dart';
import 'package:promina_task/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:promina_task/features/auth/presentation/cubit/auth_state.dart';

class StarterScreen extends StatefulWidget {
  const StarterScreen();

  @override
  State<StarterScreen> createState() => _StarterScreenState();
}

class _StarterScreenState extends State<StarterScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AuthCubit>(context).isLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) => state.mapOrNull(
        loggedIn: (_) =>
            Navigator.of(context).pushReplacementNamed(AppRoutes.gallery),
        notLoggedIn: (_) =>
            Navigator.of(context).pushReplacementNamed(AppRoutes.login),
        error: (_) => showToast(),
      ),
      child: const Scaffold(
        body: LoadingIndicator(),
      ),
    );
  }
}
