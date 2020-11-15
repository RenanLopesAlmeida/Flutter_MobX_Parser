import 'package:flutter/material.dart';
import 'package:flutter_auth/src/config/app/custom_colors.dart';
import 'package:flutter_auth/src/screens/sign_up_screen/sign_up_screen.dart';
import 'package:flutter_auth/src/shared/components/custom_button.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
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
                    Text(
                      'Login with E-mail',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'E-mail',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: CustomColors.secondaryColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: CustomColors.secondaryColor,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      obscureText: true,
                      cursorColor: CustomColors.secondaryColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                      ),
                    ),
                    CustomButton(title: 'Sign In', onPressed: () {}),
                    Divider(
                      thickness: 0.9,
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => SignUpScreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
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
