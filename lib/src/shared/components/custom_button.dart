import 'package:flutter/material.dart';
import 'package:flutter_auth/src/config/app/custom_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key key, this.title, this.onPressed}) : super(key: key);

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 20, bottom: 12),
      child: RaisedButton(
        elevation: 0,
        color: CustomColors.secondaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
