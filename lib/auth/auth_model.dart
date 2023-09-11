import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/app/exceptions/http_exception.dart';
import 'package:xb2_flutter/auth/auth.dart';

// 定义状态类,继承ChangeNotifier，就可以订阅当前类的状态变化
class AuthModel extends ChangeNotifier{
  String userId = '';
  String name = '';
  String token = '';

  bool get isLogined => token.isNotEmpty;

  // 设置缓存
  setAuth(Auth auth) {
    userId = '${auth.id}';
    name = auth.name;
    token = auth.token;

    notifyListeners();
  }

  // 存储缓存
  storeAuth(Auth auth) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('auth', jsonEncode(auth));
  }

  // 删除缓存
  removeAuth() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('auth');
  }

  Future<Auth> login(LoginData data) async {
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/login');
    final response = await http.post(uri, body: data.toJson());
    final responseBody = jsonDecode(response.body);

    if(response.statusCode == 200) {
      final auth = Auth.fromJson(responseBody);

      userId = auth.id.toString();
      name = auth.name;
      token = auth.token;

      storeAuth(auth);
      notifyListeners();

      return auth;
    } else {
      throw HttpException(responseBody['message'] ?? '网络请求出了一点问题');
    }
  }

  logout() {
    userId = '';
    name = '';
    token = '';

    removeAuth();
    notifyListeners();
  }
}