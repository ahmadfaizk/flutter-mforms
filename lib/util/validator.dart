class Validator {
  static bool isValidEmail(String email) {
    RegExp exp =
        new RegExp(r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)');
    return exp.hasMatch(email);
  }
}
