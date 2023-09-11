import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/app/app_service.dart';
import 'package:xb2_flutter/app/exceptions/http_exception.dart';

class LikeCreateModal extends ChangeNotifier {
  // 使用appservice发送网络请求
  final AppService appService;

  LikeCreateModal({
    required this.appService,
  });

  // 点赞请求方法
  createUserLikePost(int postId) async {
    // 定义请求接口
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts/$postId/like');
    // 接收响应
    final response = await appService.apiHttpClient.post(uri);
    // 响应体
    final responseBody = jsonDecode(response.body);

    // 处理响应
    if(response.statusCode == 201) {
      notifyListeners();
    } else {
      throw HttpException(responseBody['message']);
    }
  }
}