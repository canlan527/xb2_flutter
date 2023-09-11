import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/app/app_service.dart';
import 'package:xb2_flutter/post/post.dart';

// 设置两种布局方式
enum PostListLayout {
  stack,
  grid,
}

class PostIndexModel extends ChangeNotifier {
  // 定义 posts
  List<Post>? posts;
  final AppService appService;
  PostListLayout? layout;

  PostIndexModel({
    required this.appService,
    this.posts,
    this.layout = PostListLayout.stack,
  });

  // 设置layout
  setLayout(PostListLayout data) {
     layout = data;
     notifyListeners();
  }

  // 存储layout
  storeLayout(PostListLayout data) async {
    setLayout(data);
    // 获取存储实例
    final prefs = await SharedPreferences.getInstance();
    // 存储
    prefs.setString('postListLayout', data.toString());
  }

  // 转换数据类型为Post
  List<Post> parsePosts (responseBody) {
    final List<Post> parsed = jsonDecode(responseBody)
    .map<Post>((item) => Post.fromJson(item))
    .toList();

    return parsed;
  }

  // 定义获取posts方法
  Future<List<Post>> getPosts({required String sort}) async {
    // 定义请求url
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts?sort=$sort');
    // 发送请求
    final response = await appService.apiHttpClient.get(uri);
    // 赋值
    final parsed = parsePosts(response.body);
    posts = parsed;
    // 通知监听 getPosts()
    notifyListeners();
    return parsed;
  }
}
