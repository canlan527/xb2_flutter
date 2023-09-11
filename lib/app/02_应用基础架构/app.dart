import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/theme/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // 底部导航栏Item
  int currentAppBottomNavigationBarItem = 0;
  //是否显示app菜单栏
  bool showAppbar = true; 

  // 点按底部导航栏事件处理
  onTapAppBottomNavigationBarItem(int index) {
    setState(() {
      currentAppBottomNavigationBarItem = index;
      showAppbar = index == 0;
    });
  }

  // 页面主体部件
  final pageMain = [
    // 发现
    const TabBarView(
      children: [
        Icon(
          Icons.explore_outlined,
          size: 128,
          color: Colors.black12,
        ),
        Icon(
          Icons.local_fire_department_outlined,
          size: 128,
          color: Colors.black12,
        ),
      ],
    ),
    // 添加
    const Center(
      child: Icon(
        Icons.add_a_photo_outlined,
        size: 128,
        color: Colors.black12,
      ),
    ),
    // 我的
    const Center(
      child: Icon(
        Icons.account_circle_outlined,
        size: 128,
        color: Colors.black12,
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,  
      darkTheme: AppTheme.dark,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          // backgroundColor: Colors.amber.shade600,
          appBar: showAppbar ? AppBar(
            title: Image.asset(
              'assets/images/logo.png',
              width: 32,
              color: Colors.white,
            ),
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            actions: [
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.more_horiz), 
              ),
            ],
            bottom: const TabBar(tabs: [
              Tab(text: '最近',),
              Tab(text: '热门',)
            ]),
          ) : null,
          body: pageMain.elementAt(currentAppBottomNavigationBarItem),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentAppBottomNavigationBarItem,
            onTap: onTapAppBottomNavigationBarItem,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.explore_outlined),
                label: '发现',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo_outlined),
                label: '添加',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_outlined),
                label: '我的',
              ),
            ],
          ), 
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              print('floating action button');
            },
            backgroundColor: Colors.amber.shade900,
            foregroundColor: Colors.white,
            child: const Icon(Icons.share_outlined),
          ), 
        ),
      ),
    );
  }
}