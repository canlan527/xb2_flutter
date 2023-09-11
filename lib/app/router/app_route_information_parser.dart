import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/router/app_router_configuration.dart';

class AppRouteInformationParser extends RouteInformationParser<AppRouterConfiguration> {
  // 解析路由信息
  @override
  Future<AppRouterConfiguration> parseRouteInformation(RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location ?? '');

    if(routeInformation.location == '/about') {
      return AppRouterConfiguration.about();
    }

    // posts页面设置id
    if(uri.pathSegments.length == 2 && uri.pathSegments[0] == 'posts') {
      return AppRouterConfiguration.postShow(uri.pathSegments[1]);
    }

    return AppRouterConfiguration.home();
  }

  // 恢复路由信息
  @override
  RouteInformation? restoreRouteInformation(AppRouterConfiguration configuration) {
    super.restoreRouteInformation(configuration);
    if(configuration.isHomePage) {
      return RouteInformation(location: '/');
    }
    if(configuration.isAboutPage) {
      return RouteInformation(location: '/about');
    }
    if(configuration.isPostShow) {
      return RouteInformation(location: '/posts/${configuration.resourceId}');
    }
  }
}