import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      strokeWidth: 1,
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }
}
