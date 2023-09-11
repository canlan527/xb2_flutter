import 'package:flutter/material.dart';
import 'package:xb2_flutter/user/create/components/user_create_form.dart';

class UserCreate extends StatefulWidget {
  @override
  _UserCreateState createState() => _UserCreateState();
}

class _UserCreateState extends State<UserCreate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('注册用户'),
        centerTitle: true,
      ),
      body: UserCreateForm(),
    );
  }
}