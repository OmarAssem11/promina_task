import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina_task/core/presentation/resources/routes_manager.dart';
import 'package:promina_task/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:promina_task/generated/l10n.dart';

class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AlertDialog(
      title: Text(
        S.current.areYouSureYouWantToLogout,
        style: textTheme.subtitle2,
      ),
      actions: [
        TextButton(
          onPressed: () =>
              Navigator.of(context).pushReplacementNamed(AppRoutes.gallery),
          child: Text(
            S.current.no,
            style: textTheme.subtitle1,
          ),
        ),
        TextButton(
          onPressed: () {
            BlocProvider.of<AuthCubit>(context).logout();
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.of(context).pushReplacementNamed(AppRoutes.login);
          },
          child: Text(
            S.current.yes,
            style: textTheme.subtitle1,
          ),
        ),
      ],
    );
  }
}
