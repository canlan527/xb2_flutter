import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/post/post.dart';

class PostShowModel extends ChangeNotifier {
  Post? post;


  setPost(Post data) {
    post = data;
    notifyListeners();
  }

  Future<Post> getPostId(String postId) async {
    // 定义请求地址
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts/$postId');
    // 发送请求
    final response = await http.get(uri);
    // 处理数据
    final responseBody = jsonDecode(response.body);
    final parsed = Post.fromJson(responseBody);
    // 赋值
    post = parsed;
    // 通知监听
    notifyListeners();

    return parsed;
  }
}