class Validations {
  static String validateEmpty(String input, String hint, {isImage = false}) {
    if (input.isEmpty) {
      return isImage ? "Please Upload $hint" : "Please Enter $hint";
    } else {
      return "";
    }
  }

  static String validateName(String input, String hint) {
    var pattern = '[a-zA-Z]';
    RegExp regex = RegExp(pattern);

    if (input.isEmpty) {
      return "Please Enter $hint";
    } else if (input.length < 2) {
      return "Please Enter Valid $hint";
    } else if (!regex.hasMatch(input)) {
      return "Please Enter Valid $hint";
    } else {
      return "";
    }
  }

  static String validateEmail(String input, String hint) {
    if (validateEmpty(input, hint).isEmpty) {
      var pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(input)) {
        return "Please Enter Valid $hint";
      } else {
        return "";
      }
    } else {
      return "Please Enter $hint";
    }
  }

  static String validateMobile(String input, String hint) {
    if (input.isEmpty) {
      return "Please Enter $hint";
    } else if (input.length != 10) {
      return "Please Enter Valid $hint";
    } else {
      return "";
    }
  }

  static String validateUserName(String input, String hint) {
    RegExp validCharacters = RegExp(r'^[a-zA-Z0-9_\-@.]+$');

    if (input.isEmpty) {
      return "Please Enter $hint";
    } else if (input.length < 5) {
      return "Please Enter Valid $hint";
    } else if (!validCharacters.hasMatch(input)) {
      return "Please Enter Valid $hint";
    } else {
      return "";
    }
  }

  static String validatePassword(String input, String hint,
      {showCustomMessage = false}) {
    print(hint);
    var validPass = "Please Enter Valid password";
    if (input.isEmpty) {
      return "Please Enter Password";
    } else if (input.length < 8 || input.length > 16) {
      return "Password Must Be Between 8-16 Characters";
    } else if (!RegExp('.*[A-Z].*').hasMatch(input)) {
      return "Ensure Password Has One Uppercase Letters";
    } else if (!RegExp('.*[a-z].*').hasMatch(input)) {
      return "Ensure Password Has One Lower Letters";
    } else if (!RegExp('.*[!@#\$%^&*].*').hasMatch(input)) {
      return "Ensure Password Has One Special Character";
    } else if (!RegExp('.*[0-9].*').hasMatch(input)) {
      return "Ensure Password Has One Digit";
    } else {
      return "";
    }
  }

  static String validateReEnterPassword(String input, String hint,
      {showCustomMessage = false}) {
    print(hint);
    var validPass = "Please Enter Valid password";
    if (input.isEmpty) {
      return "Please Re-Enter Password";
    } else {
      return "";
    }
  }

  static String validateAmount(String input, String hint) {
    if (input.isEmpty) {
      return "Please Enter Amount";
    } else {
      return "";
    }
  }

  static String validateCVV(String input, String hint) {
    if (input.isEmpty || input.length < 3) {
      return "Invalid $hint";
    } else {
      return "";
    }
  }

  static String validateZip(String input, String hint) {
    if (input.isEmpty || input.length != 5) {
      return "Please Enter Valid $hint";
    } else {
      return "";
    }
  }

  static String validatePanNumber(String input, String hint) {
    var pattern = r'[A-Z]{5}[0-9]{4}[A-Z]{1}';
    RegExp regex = RegExp(pattern);
    if (input.isEmpty) {
      return "Please Enter PAN Number";
    } else if (!regex.hasMatch(input)) {
      return "Enter Valid PAN Number";
    } else if (input.length != 10) {
      return "Enter Valid PAN Number";
    } else {
      return "";
    }
  }

  static bool isPanNumber(String value) {
    RegExp regex = RegExp(r'[A-Z]{5}[0-9]{4}[A-Z]{1}');

    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static String cardExpiryDate(String input, String hint) {
    var split = input.split('/');

    if (input.isEmpty) {
      return "Please Enter $hint";
    } else if (int.parse(split[0]) >= 13) {
      return "Enter Valid Date ";
    } else if (input.length != 7) {
      return "Enter Valid Date ";
    } else {
      return "";
    }
  }

  static String validateCardNumber(String input, String hint) {
    if (input.isEmpty) {
      return "Please Enter $hint";
    } else if (input.length != 19) {
      return "Please Enter Validate Number";
    } else {
      return "";
    }
  }

  static bool isCardNumberValid(String value) {
    RegExp regex = RegExp(r'^-?[0-9]+$');
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static bool isMobileNumber(String value) {
    RegExp regex = RegExp(r'^-?[0-9]+$');
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }
}
