import 'package:flutter/material.dart';
import 'package:flutter_auth/src/config/app/custom_colors.dart';
import 'package:flutter_auth/src/screens/sign_up_screen/widgets/field_title.dart';
import 'package:flutter_auth/src/shared/components/custom_button.dart';

class SignUpScreen extends StatelessWidget {
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
                    FieldTitle(
                      title: 'Nickname',
                      subtitle:
                          "How it's gonna looks like in your announcements",
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      cursorColor: CustomColors.secondaryColor,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Example: Jonny D.',
                      ),
                    ),
                    const SizedBox(height: 20),
                    FieldTitle(
                      title: 'E-mail',
                      subtitle: "We'll send a confirmation by e-mail",
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      cursorColor: CustomColors.secondaryColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Example: jonny@gmail.com',
                      ),
                    ),
                    const SizedBox(height: 20),
                    FieldTitle(
                      title: 'Phone',
                      subtitle: "Protect your account",
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      cursorColor: CustomColors.secondaryColor,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '(99) 99999-9999',
                      ),
                    ),
                    const SizedBox(height: 20),
                    FieldTitle(
                      title: 'Password',
                      subtitle:
                          "Use characters, numbers and special characters",
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      cursorColor: CustomColors.secondaryColor,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    FieldTitle(
                      title: 'Confirm Password',
                      subtitle: "repeat your password",
                    ),
                    const SizedBox(height: 4),
                    TextField(
                      cursorColor: CustomColors.secondaryColor,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    CustomButton(
                      title: 'Sign Up',
                      onPressed: () {},
                    ),
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