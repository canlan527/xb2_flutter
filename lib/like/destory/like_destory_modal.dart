import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/app/app_service.dart';
import 'package:xb2_flutter/app/exceptions/http_exception.dart';

class LikeDestoryModal extends ChangeNotifier {
  final AppService appService;

  LikeDestoryModal({
    required this.appService,
  });

  // 定义取消like请求的方法
  deleteUserLikePost(int postId) async {
    // 定义请求uri
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts/$postId/like');
    // 使用appservice发送delete请求
    final response = await appService.apiHttpClient.delete(uri);
    // 接收响应体
    final responseBody = jsonDecode(response.body);
    // 处理响应
    if(response.statusCode == 200) {
      notifyListeners();
    } else {
      throw HttpException(responseBody['message']);
    }
  }
}