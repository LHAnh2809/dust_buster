import 'package:get/get.dart';
import 'package:dust_buster/app/common/util/exports.dart';

class Validators {
  Validators._();
  static final RegExp regexDouble = RegExp(r'([.]*0)(?!.*\d)');
  static String? validateEmpty(String? v) {
    if (v!.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else {
      return null;
    }
  }

  static String? validateTEmpty<T>(T? v) {
    if (v == null) {
      return Strings.fieldCantBeEmpty;
    } else {
      return null;
    }
  }

  static bool validateEmail(String? v) {
    if (v!.isEmpty) {
      return false;
    } else if (GetUtils.isEmail(v)) {
      return true;
    }
    return false;
  }

  static String? validatePhone(String? v) {
    if (v!.isEmpty) {
      return Strings.fieldCantBeEmpty;
    } else if (v.length != 10) {
      return Strings.enterValidNumber;
    } else {
      return null;
    }
  }

  // static String? validateEmailPhone(String? v) {
  //   if (v!.isEmpty) {
  //     return Strings.fieldCantBeEmpty;
  //   } else if (GetUtils.isNumericOnly(v)) {
  //     return validatePhone(v);
  //   } else {}
  // }

  static String? validatePassword(String? v) {
    if (v!.isEmpty) {
      return Strings.passwordCantBeEmpty;
    } else if (v.length < 8) {
      return Strings.passwordValidation;
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? v, String password) {
    if (v!.isEmpty || password.isEmpty) {
      return Strings.passwordCantBeEmpty;
    } else if (v.length < 8 || password.length < 8 || v != password) {
      return Strings.confirmPasswordValidation;
    } else {
      return null;
    }
  }

  static String? validateCheckbox({
    bool v = false,
    String error = Strings.checkboxValidation,
  }) {
    if (!v) {
      return error;
    } else {
      return null;
    }
  }

  static bool validateName(String value) {
    if (value.isNullOrEmpty) {
      return false;
    }
    String pattern = r'^[a-zA-Z\s\.]+$';
    RegExp regExp = RegExp(pattern);
    return !regExp.hasMatch(value);
  }

  static bool validateDomain(String value) {
    if (value.isNullOrEmpty) {
      return true;
    }
    String pattern = r'^[a-z0-9]+$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(value);
  }

  static bool validateUppercaseAndLowercase(String value) {
    if (value.isNullOrEmpty) {
      return false;
    }
    String patternUpper = r'^(?=.*?[A-Z])';
    String patternLower = r'(?=.*?[a-z])';
    RegExp regExpUpper = RegExp(patternUpper);
    RegExp regExpLower = RegExp(patternLower);

    return regExpUpper.hasMatch(value) && regExpLower.hasMatch(value);
  }

  static bool validateNumber(String value) {
    if (value.isNullOrEmpty) {
      return false;
    }
    String pattern = r'(?=.*?[0-9])';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(value);
  }

  static bool validateSpecial(String value) {
    if (value.isNullOrEmpty) {
      return false;
    }
    String pattern = r'(?=.*?[!@#\$&*~])';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(value);
  }
}
