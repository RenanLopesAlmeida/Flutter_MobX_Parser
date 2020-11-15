import 'package:flutter_auth/src/models/user_model.dart';
import 'package:flutter_auth/src/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_auth/src/shared/helpers/extensions.dart';

part 'sign_up_store.g.dart';

class SignUpStore = _SignUpStoreBase with _$SignUpStore;

abstract class _SignUpStoreBase with Store {
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length >= 6;
  String get nameError {
    if (name == null || nameValid) {
      return null;
    } else if (name.isEmpty) {
      return 'Required Field';
    } else {
      return 'name is too short';
    }
  }

  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid => email != null && email.isEmailValid();
  String get emailError {
    if (email == null || emailValid) {
      return null;
    } else if (email.isEmpty) {
      return 'Required Field';
    } else {
      return 'Invalid E-mail';
    }
  }

  @observable
  String phone;

  @action
  void setPhone(String value) => phone = value;

  @computed
  bool get phoneValid => phone != null && phone.length >= 14;
  String get phoneError {
    if (phone == null || phoneValid) {
      return null;
    } else if (phone.isEmpty) {
      return 'Required Field';
    } else {
      return 'Invalid Phone';
    }
  }

  @observable
  String password;

  @action
  void setPassword(String value) => password = value;

  @computed
  bool get passwordValid => password != null && password.length >= 6;
  String get passwordError {
    if (password == null || passwordValid) {
      return null;
    } else if (password.isEmpty) {
      return 'Required Field';
    } else {
      return 'Invalid Password';
    }
  }

  @observable
  String confirmPassword;

  @action
  void setConfirmPassword(String value) => confirmPassword = value;

  @computed
  bool get confirmPasswordValid =>
      confirmPassword != null && confirmPassword == password;
  String get confirmPasswordPasswordError {
    if (confirmPassword == null || confirmPasswordValid) {
      return null;
    } else if (confirmPassword.isEmpty) {
      return 'Required Field';
    } else {
      return 'Passwords must match';
    }
  }

  @computed
  bool get isFormValid => (nameValid &&
      emailValid &&
      phoneValid &&
      passwordValid &&
      confirmPasswordValid);

  @computed
  Function get signUpPressed => (isFormValid) ? _signUp : null;

  @observable
  bool loading = false;

  @observable
  String errorMessage;

  @action
  Future<void> _signUp() async {
    loading = true;

    final User user = User(
      nickname: name,
      email: email,
      password: password,
      phone: phone,
    );

    try {
      await UserRepository().signUp(user);
    } catch (e) {
      errorMessage = e;
    }

    loading = false;
  }
}
