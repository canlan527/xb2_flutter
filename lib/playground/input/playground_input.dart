import 'package:flutter/material.dart';
import 'package:xb2_flutter/user/create/user_create.dart';

class PlaygroundInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.indigo[50],
      padding: EdgeInsets.all(26),
      width: double.infinity,
      child: UserCreate(),
    );
  }
}