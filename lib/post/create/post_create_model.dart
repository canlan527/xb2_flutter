import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/app_config.dart';
import 'package:xb2_flutter/app/app_service.dart';
import 'package:xb2_flutter/app/exceptions/http_exception.dart';

class PostCreateModel extends ChangeNotifier {
  final AppService appService;

  PostCreateModel({
    required this.appService,
  });

  // 声明要创建post需要的变量
  String? title;
  String? content;
  PlatformFile? selectedFile;
  bool loading = false;

  // 设置title
  setTitle(String? data) {
    title = data;
  }
  // 设置content
  setContent(String? data) {
    content = data;
  }
  // 设置selectedFile
  setSelectedFile(PlatformFile? data) {
    selectedFile = data;
    notifyListeners();
  }

  // 设置loading
  setLoading(bool data) {
    loading = data;
    notifyListeners();
  }

  // 重置变量
  reset() {
    title = null;
    content = null;
    selectedFile = null;
  }
  
  bool hasData() {
    return title != null || content != null || selectedFile != null ? true : false;
  }

  // 创建post的请求方法,返回创建的post的id
  Future<int> createPost() async {
    // 定义请求的uri
    final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts');
    // appservice发送请求
    final response = await appService.apiHttpClient.post(uri, body: {
      'title': title,
      'content': content,
    });
    // responseBody
    final responseBody = jsonDecode(response.body);

    // 处理响应
    if(response.statusCode == 201) {
      final postId = responseBody['insertId'];
      return postId;
    } else {
      throw HttpException();
    }
  }

  // 创建文件上传的请求方法
  Future<bool> createFile({required int postId}) async {
    // 发送请求
    final response = await appService.apiHttpClient.uploadImage(
      file: selectedFile!, 
      postId: postId
    );
    // 处理响应
    if(response.statusCode == 201) {
      return true;
    } else {
      throw HttpException('上传文件失败了');
    }
  }
}