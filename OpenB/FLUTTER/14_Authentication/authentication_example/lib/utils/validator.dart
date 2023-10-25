class Validator {
  static String? validateName(String? name) {
    if (name == null) return null;

    if (name.isEmpty) {
      return 'Name can\'t be empty';
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email == null) return null;

    RegExp emailRegExp =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    if (email.isEmpty) {
      return 'Email can\'t be empty';
    } else if (!emailRegExp.hasMatch(email)) {
      return 'Enter a valid email addres';
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null) return null;

    if (password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'please, insert a password with lenght at least 6';
    }
    return null;
  }
}
