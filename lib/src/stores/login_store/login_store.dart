import 'package:flutter_auth/src/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_auth/src/shared/helpers/extensions.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
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
      return 'Required field';
    } else {
      return 'Incorrect email format';
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
      return 'Required field';
    } else {
      return 'Password is too short';
    }
  }

  @computed
  bool get formValid => emailValid && passwordValid;

  Function get loginPressed => (formValid) ? _handleLogin : null;

  @observable
  bool loading = false;

  @observable
  String errorMessage;

  @action
  Future<void> _handleLogin() async {
    loading = true;

    try {
      final user =
          await UserRepository().loginWithEmailAndPassword(email, password);
    } catch (e) {
      errorMessage = e;
    }

    loading = false;
  }
}
