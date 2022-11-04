import 'package:promina_task/generated/l10n.dart';

String? emailValidator(String? email) {
  const String regexEmailFormat =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  if (email == null || email.isEmpty) {
    return S.current.emailCanNotBeEmpty;
  } else if (!RegExp(regexEmailFormat).hasMatch(email)) {
    return S.current.invalidEmailFormat;
  }
  return null;
}

String? passwordValidator(String? password) {
  if (password == null || password.length < 8) {
    return S.current.passwordCanNotBeLessThanEightCharacters;
  }
  return null;
}

String? generalValidator({
  required String fieldName,
  required String? value,
}) {
  if (value == null || value.isEmpty) {
    return '$fieldName ${S.current.canNotBeEmpty}';
  }
  return null;
}
