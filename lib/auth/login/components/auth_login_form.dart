import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/app_model.dart';
import 'package:xb2_flutter/app/components/app_button.dart';
import 'package:xb2_flutter/app/components/app_header_text.dart';
import 'package:xb2_flutter/app/components/app_password_field.dart';
import 'package:xb2_flutter/app/components/app_text_field.dart';
import 'package:xb2_flutter/app/exceptions/http_exception.dart';
import 'package:xb2_flutter/auth/auth.dart';
import 'package:xb2_flutter/auth/auth_model.dart';

class AuthLoginForm extends StatefulWidget {
  @override
  State<AuthLoginForm> createState() => _AuthLoginFormState();
}

class _AuthLoginFormState extends State<AuthLoginForm> {
  String? name;

  String? password;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // 获取数据模型
    final authModel = Provider.of<AuthModel>(context, listen: true);
    final appModel = context.read<AppModel>();

    // 标题
    final header = AppHeaderText('用户登录');
    // 用户名
    final usernameField = AppTextField(labelText: '用户名', onChanged: (value) => name = value);

    // 密码
    final passwordField = AppPasswordField(labelText: '密码', onChanged: (value) => password = value,);

    // 确认按钮
    final submitButton = AppButton(onPressed:  () async {
      // 验证表单
      formKey.currentState!.validate();

      try {
        // 请求登录方法
        await authModel.login(LoginData(name: name!, password: password!));
        // 登录成功后跳转路由
        appModel.setPageName('');
      } on HttpException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message))
        );
      }

    }, text: '确定登录',);

    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header,
              usernameField,
              passwordField,
              submitButton,
            ],
          )),
    );
  }
}
