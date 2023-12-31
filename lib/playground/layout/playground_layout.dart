import 'package:flutter/material.dart';
import 'package:xb2_flutter/playground/layout/components/playground_layout_item.dart';

class PlaygroundLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: SizedBox.expand(
          child: Container(
            color: Colors.greenAccent,
            child: SafeArea(child: PlaygroundLayoutItem('文字')),
          ),
        ),
      ),
    );
  }
}
