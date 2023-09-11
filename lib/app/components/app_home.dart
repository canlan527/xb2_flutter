import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/post/create/post_create_model.dart';

import 'app_page_aside.dart';
import 'app_page_bottom.dart';
import 'app_page_header.dart';
import 'app_page_main.dart';

class AppHome extends StatefulWidget {
  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  // 底部导航栏Item
  int currentAppBottomNavigationBarItem = 0;
  //是否显示app菜单栏
  bool showAppbar = true;

  // 点按底部导航栏事件处理
  onTapAppBottomNavigationBarItem(int index) async {
    // 获取postCreateModel
    final postCreateModel = context.read<PostCreateModel>();

    final retainDataAlertDialog = AlertDialog(
      title: const Text('是否保留未发布的内容？'),
      actions: [
        TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text('否')),
        TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text('是')),
      ],
    );

    if(currentAppBottomNavigationBarItem == 1 && postCreateModel.hasData()) {
      final retainDataResult = await showDialog(context: context, builder: (context) => retainDataAlertDialog);
      // 用户选择是，什么也不做
      if(retainDataResult == null) {
        return;
      }
      // 用户选择否，即不保留已编辑的内容
      if(!retainDataResult) {
        postCreateModel.reset();
      }
    }

    setState(() {
      currentAppBottomNavigationBarItem = index;
      showAppbar = index == 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        // backgroundColor: Colors.amber.shade600,
        appBar: showAppbar ? AppPageHeader() : null,
        body: AppPageMain(index: currentAppBottomNavigationBarItem),
        bottomNavigationBar: AppPageBottom(
          index: currentAppBottomNavigationBarItem,
          onTap: onTapAppBottomNavigationBarItem,
        ),
        // floatingActionButton: AppSharedButton(),
        drawer: AppPageAside(),
      ),
    );
  }
}
