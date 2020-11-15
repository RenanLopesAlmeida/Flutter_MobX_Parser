import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  const ErrorBox({Key key, this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return (message == null)
        ? SizedBox()
        : Container(
            padding: const EdgeInsets.all(9),
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Wrap(
              children: [
                Icon(Icons.error, color: Colors.white, size: 32),
                SizedBox(width: 5),
                Text(
                  'Oops! $message. Please try again later',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          );
  }
}
