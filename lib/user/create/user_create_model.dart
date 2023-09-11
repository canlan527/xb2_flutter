import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/app/exceptions/http_exception.dart';

class UserCreateModel extends ChangeNotifier{
  Future<int> createUser({
    required String name,
    required String password,
  }) async {
    // 准备uri
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/users');
    // 发送请求
    final response =  await http.post(uri, body: {
      'name': name,
      'password': password,
    });
    // 响应体
    final responseBody = jsonDecode(response.body);
    // 处理响应
    if(response.statusCode == 201) {
      notifyListeners();
      return responseBody['insertId'];
    } else {
      throw HttpException(responseBody['message']);
    }
  }
}