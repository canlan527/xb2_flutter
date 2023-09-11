import 'package:flutter/material.dart';

class AppPageAside extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
             UserAccountsDrawerHeader(
              accountName: Text('相柳'),
              accountEmail: Text('liqingzhao@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://c-ssl.duitang.com/uploads/item/201902/13/20190213131432_nSyKQ.png'
                ),
              ),
            ),
            ListTile(
              title: Text('作品', textAlign: TextAlign.right,),
              trailing: Icon(Icons.image_outlined, color: Colors.black26, size: 22,),
            ),
            ListTile(
              title: Text('评论', textAlign: TextAlign.right,),
              trailing: Icon(Icons.comment_outlined, color: Colors.black26, size: 22,),
            ),
            Divider(),
            ListTile(
              title: Text('用户', textAlign: TextAlign.right,),
              trailing: Icon(Icons.manage_accounts_outlined, color: Colors.black26, size: 22,),
            ),
            ListTile(
              title: Text('管理', textAlign: TextAlign.right,),
              trailing: Icon(Icons.collections_outlined, color: Colors.black26, size: 22,),
            ),
            Divider(),
             ListTile(
              title: Text('退出', textAlign: TextAlign.right,),
              trailing: Icon(Icons.logout_outlined, color: Colors.black26, size: 22,),
            ),
          ],
        ),
      ),
    );
  }
}
