import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;

  AppButton({
    required this.onPressed,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              minimumSize: const Size(double.infinity, 60),
            ),
            // 通过key获取表单内容
            onPressed: onPressed,
            child: Text(text ?? '按钮')
          ),
    );
  }
}