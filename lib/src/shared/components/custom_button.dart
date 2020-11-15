import 'package:flutter/material.dart';
import 'package:flutter_auth/src/config/app/custom_colors.dart';
import 'package:flutter_auth/src/shared/components/custom_progress_indicator/custom_progress_indicator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    this.title,
    this.onPressed,
    this.loading = false,
  }) : super(key: key);

  final String title;
  final Function onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 20, bottom: 12),
      child: RaisedButton(
        elevation: 0,
        color: CustomColors.secondaryColor,
        disabledColor: CustomColors.secondaryColor.withAlpha(120),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        onPressed: onPressed,
        child: (loading)
            ? CustomProgressIndicator()
            : Text(
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
