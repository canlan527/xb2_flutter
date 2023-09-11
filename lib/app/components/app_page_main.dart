import 'package:flutter/material.dart';
import 'package:xb2_flutter/playground/playground.dart';
import 'package:xb2_flutter/post/create/post_create.dart';
import 'package:xb2_flutter/post/index/index_post.dart';
import 'package:xb2_flutter/user/profile/user_profile.dart';

class AppPageMain extends StatelessWidget {
  final int index;

  AppPageMain({ this.index = 0});

  // 页面主体部件
  final pageMain = [
    // 发现
    PostIndex(),
    // 添加
    PostCreate(),
    // 我的
    UserProfile(),
    // 练习
    Playground(),
  ];


  @override
  Widget build(BuildContext context) {
    return pageMain.elementAt(index);
  }
}