import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xb2_flutter/app/app_model.dart';
import 'package:xb2_flutter/app/app_provider.dart';
import 'package:xb2_flutter/like/like_provider.dart';
import 'package:xb2_flutter/post/post_provider.dart';
import 'package:xb2_flutter/app/router/app_route_information_parser.dart';
import 'package:xb2_flutter/app/router/app_router_delegate.dart';
import 'package:xb2_flutter/app/theme/app_theme.dart';
import 'package:xb2_flutter/auth/auth.dart';
import 'package:xb2_flutter/auth/auth_model.dart';
import 'package:xb2_flutter/user/user_provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {

  final AppModel appModal = AppModel();
  final AuthModel authModel = AuthModel();

  // 正在初始化
  bool initializing = true;

  initialize() async {
    final prefs = await SharedPreferences.getInstance();
    final hasAuth = prefs.containsKey('auth');

    if(hasAuth) {
      // frmoJson 可以将Map类型的数据转换成Auth类型的数据
      final auth = Auth.fromJson(jsonDecode(prefs.getString('auth')!));
      authModel.setAuth(auth);
    }

    setState(() {
      initializing = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    // 添加初始化界面
    if(initializing) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: const Scaffold(
          body: Center(
            child: Text('初始化...'),
          ),
        ),
      );
    }

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authModel),
        ChangeNotifierProvider.value(value: appModal),
        ...appProviders,
        ...postProviders,
        ...likeProviders,
        ...userProviders,
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerDelegate: AppRouterDelegate(appModal),
        routeInformationParser: AppRouteInformationParser(),
      ),
    );
  }
}
