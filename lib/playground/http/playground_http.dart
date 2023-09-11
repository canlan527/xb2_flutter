import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xb2_flutter/user/user.dart';

import '../../app/app_config.dart';

class PlaygroundHttp extends StatefulWidget {
  @override
  State<PlaygroundHttp> createState() => _PlaygroundHttpState();
}

class _PlaygroundHttpState extends State<PlaygroundHttp> {
  String? currentUsername; 
 // 用户名
  String? currentUserToken; 
 // 验证用户登录的token
  getUser() async {
    final uri = Uri.parse('https://nid-node.ninghao.co/users/116');
    final response = await http.get(uri);
    print('状态码${response.statusCode}');
    print('响应主体${response.body}');

    if(response.statusCode == 200) {
      final user = User.fromJson(response.body);
      print(user.id);
      print(user.name);
      // user.avatar
    }

  }

  // 请求创建用户
  createUser() async {
    final name = '灿烂';
    final password = '123456';
    // 准备要请求的地址
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/users');
    final response = await http.post(uri, body: {
      'name': name,
      'password': password,
    });

    print('状态码 ${response.statusCode}');
    print('响应主体 ${response.body}');
  }

  // 发送登录请求
  login() async {
    final name = '宇宙';
    final password = '123456';
    // 准备要请求的地址
    final uri = Uri.parse('https://nid-node.ninghao.co/login');
    final response = await http.post(uri, body: {
      'name': name,
      'password': password,
    });

    print('状态码 ${response.statusCode}');
    print('响应主体 ${response.body}');
  
    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      
      setState(() {
        currentUsername = result['name'];
        currentUserToken = result['token'];
      });
    }
  }
  
  // 更新用户信息
  updateUser() async {
    final name = '宇宙';
    final password = '123456';

    final uri = Uri.parse('https://nid-node.ninghao.co/users');

    final headers = {
      'Authorization': 'Bearer $currentUserToken',
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    final body = jsonEncode({
      'validate': {
        'password': password,
      },
      'update': {
        'name': name,
      }
    });


    final response = await http.patch(uri, headers: headers, body: body,);

    print('状态码 ${response.statusCode}');
    print('响应主体 ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber[50],
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(currentUsername ?? '未登录', style: Theme.of(context).textTheme.headline6,),
          ElevatedButton(onPressed: getUser, child: const Text('发送请求')),
          ElevatedButton(onPressed: createUser, child: const Text('创建用户')),
          ElevatedButton(onPressed: login, child: const Text('用户登录')),
          ElevatedButton(onPressed: updateUser, child: const Text('更新用户')),
        ],
      ),
    );
  }
}