import 'package:flutter/material.dart';
import 'package:xb2_flutter/post/post.dart';

class PostTags extends StatelessWidget {
  final List<PostTag> tags;

  PostTags({
    required this.tags,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: tags.map((item) => Chip(label: Text(item.name!))).toList(),
      ),
    );
  }
}