import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_auth/src/config/app/custom_colors.dart';
import 'package:flutter_auth/src/screens/sign_up_screen/widgets/field_title.dart';
import 'package:flutter_auth/src/shared/components/custom_button.dart';
import 'package:flutter_auth/src/shared/components/error_box/error_box.dart';
import 'package:flutter_auth/src/stores/sign_up_store/sign_up_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class SignUpScreen extends StatelessWidget {
  final _signUpStore = GetIt.I<SignUpStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Observer(builder: (_) {
                      return ErrorBox(
                        message: _signUpStore.errorMessage,
                      );
                    }),
                    FieldTitle(
                      title: 'Nickname',
                      subtitle:
                          "How it's gonna looks like in your announcements",
                    ),
                    const SizedBox(height: 4),
                    Observer(
                      builder: (_) => TextField(
                        cursorColor: CustomColors.secondaryColor,
                        onChanged: _signUpStore.setName,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Example: Jonny D.',
                          errorText: _signUpStore.nameError,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FieldTitle(
                      title: 'E-mail',
                      subtitle: "We'll send you a confirmation by e-mail",
                    ),
                    const SizedBox(height: 4),
                    Observer(builder: (_) {
                      return TextField(
                        cursorColor: CustomColors.secondaryColor,
                        keyboardType: TextInputType.emailAddress,
                        onChanged: _signUpStore.setEmail,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Example: jonny@gmail.com',
                          errorText: _signUpStore.emailError,
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    FieldTitle(
                      title: 'Phone',
                      subtitle: "Protect your account",
                    ),
                    const SizedBox(height: 4),
                    Observer(builder: (_) {
                      return TextField(
                        cursorColor: CustomColors.secondaryColor,
                        keyboardType: TextInputType.number,
                        onChanged: _signUpStore.setPhone,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '(99) 99999-9999',
                          errorText: _signUpStore.phoneError,
                        ),
                        inputFormatters: [
                          WhitelistingTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                      );
                    }),
                    const SizedBox(height: 20),
                    FieldTitle(
                      title: 'Password',
                      subtitle:
                          "Use characters, numbers and special characters",
                    ),
                    const SizedBox(height: 4),
                    Observer(builder: (_) {
                      return TextField(
                        cursorColor: CustomColors.secondaryColor,
                        obscureText: true,
                        onChanged: _signUpStore.setPassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          errorText: _signUpStore.passwordError,
                        ),
                      );
                    }),
                    const SizedBox(height: 20),
                    FieldTitle(
                      title: 'Confirm Password',
                      subtitle: "repeat your password",
                    ),
                    const SizedBox(height: 4),
                    Observer(builder: (_) {
                      return TextField(
                        cursorColor: CustomColors.secondaryColor,
                        obscureText: true,
                        onChanged: _signUpStore.setConfirmPassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          errorText: _signUpStore.confirmPasswordPasswordError,
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      return CustomButton(
                        title: 'Sign Up',
                        onPressed: _signUpStore.signUpPressed,
                        loading: _signUpStore.loading,
                      );
                    }),
                    Divider(thickness: 0.9),
                    const SizedBox(height: 20),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: Navigator.of(context).pop,
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 16,
                              color: CustomColors.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
