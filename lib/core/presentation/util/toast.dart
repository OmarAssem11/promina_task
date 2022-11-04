import 'package:fluttertoast/fluttertoast.dart';
import 'package:promina_task/generated/l10n.dart';

void showToast([String? message]) => Fluttertoast.showToast(
      msg: message ?? S.current.somethingWentWrong,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
