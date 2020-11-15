extension StringExtension on String {
  bool isEmailValid() {
    final RegExp regex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    // quando fizermos: minhaString.isEmailValid(). O this vai ser a string que chamou o isEmailValid
    return regex.hasMatch(this);
  }
}
