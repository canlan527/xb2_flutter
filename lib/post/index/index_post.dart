import 'package:flutter/material.dart';
import 'package:xb2_flutter/post/index/components/post_latest.dart';
import 'package:xb2_flutter/post/index/components/post_popular.dart';


class PostIndex extends StatelessWidget {
  const PostIndex({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      children: [
        PostLatest(),
        PostPopular(),
      ],
    );
  }
}
