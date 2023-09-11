import 'package:flutter/material.dart';

class AppBottomSheet extends StatelessWidget {
  // 显示对话框
  showAppAlertDialog(context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('确定提交'),
        content: const Text('提交会无法恢复，确定要提交吗？'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text('取消')),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: const Text('确定'))
        ],
      ),
    );
  }

  // 显示操作提示栏
  void showAppSnackBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('提交成功'),
        action: SnackBarAction(label: '关闭', onPressed: (){

        }),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, -20),
              blurRadius: 30,
            )
          ]),
      child: Center(
        child: TextButton(
            onPressed: () async {
              final result = await showAppAlertDialog(context);
              print('showAppAlertDialog: $result');
              // 确定操作
              if(result != null && result) {
                showAppSnackBar(context);
              }
            },
            child: const Text('提交')),
      ),
    );
  }
}
