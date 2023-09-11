import 'package:flutter/material.dart';

class AppPasswordField extends StatelessWidget {
  final String? labelText;
  final ValueChanged<String>? onChanged;

  AppPasswordField({
    this.labelText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 32),
      child: TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: labelText ?? '密码',
            ),
            onChanged: onChanged,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if(value == null || value.isEmpty) {
                return '请输入密码';
              }
              if(value.isNotEmpty && value.length < 6) {
                return '请设置6位以上的密码';
              }
              return null; // 返回null代表验证通过
    
            },
          ),
    );
  }
}