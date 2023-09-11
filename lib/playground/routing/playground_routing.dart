import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/app_model.dart';
// import 'package:xb2_flutter/app/playground/layout/playground_layout.dart';
// import 'package:xb2_flutter/app/playground/routing/components/about.dart';

class PlaygroundRouting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appModle = Provider.of<AppModel>(context);
    return Container(
      color: Colors.amber[50],
      padding: EdgeInsets.all(26),
      width: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                appModle.setPageName('About');
              },
              child: const Text(
                '查看柯南介绍',
                style: TextStyle(fontSize: 20),
              )),
          ],
        ),
      ),
    );
  }
}
