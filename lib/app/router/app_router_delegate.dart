import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/app_model.dart';
import 'package:xb2_flutter/post/show/post_show.dart';
import 'package:xb2_flutter/post/show/post_show_model.dart';
import 'package:xb2_flutter/app/router/app_router_configuration.dart';
import 'package:xb2_flutter/auth/login/auth_login.dart';
import 'package:xb2_flutter/user/create/user_create.dart';

import '../components/app_home.dart';
import '../../playground/routing/components/about.dart';

class AppRouterDelegate extends RouterDelegate<AppRouterConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final _navigatorKey;
  final AppModel appModal;
  // 构造函数，使用AppRouterDelegate的时候传递key值。
  AppRouterDelegate(this.appModal)
      : _navigatorKey = GlobalKey<NavigatorState>() {
    // 监听路由响应
    appModal.addListener(notifyListeners);
  }

  // 销毁监听
  @override
  void dispose() {
    super.dispose();
    appModal.removeListener(notifyListeners);
  }

  // 获取Navigator使用的key
  @override
  get navigatorKey => _navigatorKey;

  // 设置路由新地址
  @override
  Future<void> setNewRoutePath(configuration) async {
    if (configuration.isAboutPage) {
      appModal.setPageName('About');
    }
    if (configuration.isHomePage) {
      appModal.setPageName('');
    }
    if (configuration.isPostShow) {
      appModal.setPageName('PostShow');
      appModal.setResourceId('${configuration.resourceId}');
    }
  }

  // 把路由配置转换成路由信息（restoreRouteInformation）
  @override
  get currentConfiguration {
    if (appModal.pageName == '') {
      return AppRouterConfiguration.home();
    }

    if (appModal.pageName == 'About') {
      return AppRouterConfiguration.about();
    }

    if (appModal.pageName == 'PostShow') {
      return AppRouterConfiguration.postShow(appModal.resourceId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final postShowModel = context.read<PostShowModel>();
    return Navigator(
      // key: _navigatorKey,
      pages: [
        MaterialPage(key: const ValueKey('AppHome'), child: AppHome()),
        if (appModal.pageName == 'About')
          MaterialPage(
            key: const ValueKey('About'),
            child: About(),
          ),
        if (appModal.pageName == 'PostShow' && appModal.resourceId != null)
          MaterialPage(
              key: const ValueKey('PostShow'),
              child: PostShow(appModal.resourceId!, post: postShowModel.post)),
        if (appModal.pageName == 'AuthLogin')
          MaterialPage(key: ValueKey('AuthLogin'), child: AuthLogin()),
        if (appModal.pageName == 'UserCreate')
          MaterialPage(key: ValueKey('UserCreate'), child: UserCreate()),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        appModal.setPageName('');
        return true;
      },
    );
  }
}
