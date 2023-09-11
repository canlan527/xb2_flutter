import 'package:flutter/material.dart';

class AppPageBottom extends StatelessWidget {
  final int index;
  final ValueChanged<int>? onTap;

  AppPageBottom({this.onTap, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: index,
      onTap: onTap,
      // unselectedItemColor: Colors.black,
      // selectedItemColor: Colors.amber.shade900,
      // showSelectedLabels: true,
      // type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore_outlined),
          activeIcon: Icon(Icons.explore),
          label: '发现',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_a_photo_outlined),
          activeIcon: Icon(Icons.add_a_photo),
          label: '添加',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          activeIcon: Icon(Icons.account_circle),
          label: '我的',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.sports_volleyball),
        //   label: '练习',
        // ),
      ],
    );
  }
}
