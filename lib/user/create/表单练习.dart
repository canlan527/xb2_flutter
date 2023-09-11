import 'package:flutter/material.dart';

class UserCreate extends StatefulWidget {

  @override
  State<UserCreate> createState() => _UserCreateState();
}

class _UserCreateState extends State<UserCreate> {
  String? name;
  String? password;

  // 给表单字段创建key，通过获取key可以获取表单内容，进行验证等功能
  final nameFieldKey = GlobalKey<FormFieldState>();
  final passwordFieldKey = GlobalKey<FormFieldState>();
  final formKey = GlobalKey<FormState>(); //Form表单的key，可以统一管理form内的表单项的值

  // 文本编辑控制器：TextEditingController
  final nameFieldController = TextEditingController();
  final passwordFildController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    // 如果在不需要控制器的页面仍然保留控制器，会占用内存，因此需要删除
    nameFieldController.dispose();
    passwordFildController.dispose();
  }

  @override
  void initState() {
    super.initState();

    // 通过表单控制器监听表单内容
    nameFieldController.addListener(() { 
      print('name: ${nameFieldController.text}');
    });
    passwordFildController.addListener(() {
      print('password: ${passwordFildController.text}');
    });

    // 通过表单控制器设置初始值
    // nameFieldController.text = 'xiaonan';
    // passwordFildController.text = '123456';
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '注册用户',
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 32,),
          TextFormField(
            key: nameFieldKey,
            controller: nameFieldController,
            decoration: const InputDecoration(
              labelText: '用户名',
            ),
            onChanged: (value) => name = value,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: (value) {
              if(value == null || value.isEmpty) {
                return '请输入用户名';
              }
              return null; // 返回null代表验证通过
            },
          ),
          const SizedBox(height: 32,),
           TextFormField(
            key: passwordFieldKey,
            controller: passwordFildController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: '密码'
            ),
            onChanged: (value) => password = value,
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
          const SizedBox(height: 32,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              minimumSize: const Size(double.infinity, 60),
            ),
            // 通过key获取表单内容
            onPressed: () {
              // 调用表单验证,每个表单项都逐一验证
              // nameFieldKey.currentState!.validate();
              // passwordFieldKey.currentState!.validate();
              
              // 使用form验证其包裹的表单项的内容
              formKey.currentState!.validate();

              print('用户名：${nameFieldKey.currentState!.value}, 密码：${passwordFieldKey.currentState!.value}');
            },
            // onPressed: () => print('用户名：$name, 密码：$password'),
            child: const Text('注册用户')
          )
        ],
      ),
    );
  }
}