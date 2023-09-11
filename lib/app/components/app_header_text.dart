import 'package:flutter/material.dart';

class AppHeaderText extends StatelessWidget {
  String data;
  AppHeaderText(this.data);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 32),
      child: Text(
        data,
        style: const TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 32,
        ),
      ),
    );
  }
}
