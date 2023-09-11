import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/components/app_logo.dart';
import 'package:xb2_flutter/app/components/app_page_header_actions_more.dart';

class AppPageHeader extends StatelessWidget implements PreferredSize {
  @override
  final Size preferredSize = Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppLogo(),
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(Icons.menu),
      ),
      actions: [
        AppPageHeaderActionsMore(),
      ],
      bottom: const TabBar(
        // labelColor: Colors.white, 
        tabs: [
          Tab(
            text: '最近',
          ),
          Tab(
            text: '热门',
          )
        ]
      ),
    );
  }

  @override
  // TODO: implement child
  Widget get child => Container();
}
