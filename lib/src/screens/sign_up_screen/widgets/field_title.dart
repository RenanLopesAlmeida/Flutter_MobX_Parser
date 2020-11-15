import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle({Key key, this.title, this.subtitle}) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 5),
        Text(
          subtitle,
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
