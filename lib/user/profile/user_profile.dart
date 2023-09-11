import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/app_model.dart';
import 'package:xb2_flutter/auth/auth_model.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 准备数据
    final appModel = context.read<AppModel>();
    final authModel = context.watch<AuthModel>();

    // 登录按钮
    final login = TextButton(
        onPressed: () {
          appModel.setPageName('AuthLogin');
        },
        child: Text('登录'));

    // 登录按钮
    final register = TextButton(
        onPressed: () {
          appModel.setPageName('UserCreate');
        },
        child: Text('注册'));
    
    // 分隔符
    final separator = Text('/');

    // 一组部件
    final actions = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        login,
        separator,
        register,
      ],
    );

    // 用户部分
    final userProfile = TextButton(
        onPressed: () {
          authModel.logout();
        },
        child: Text(authModel.name));

    // 使用 Consumer 获取数据
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.account_circle_outlined,
            size: 128,
            color: Colors.black12,
          ),
          authModel.isLogined ? userProfile : actions,
        ],
      ),
    );
  }
}
