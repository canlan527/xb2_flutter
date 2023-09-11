import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/app_model.dart';
import 'package:xb2_flutter/post/components/post_header.dart';
import 'package:xb2_flutter/post/components/post_media.dart';
import 'package:xb2_flutter/post/index/post_index_model.dart';
import 'package:xb2_flutter/post/post.dart';
import 'package:xb2_flutter/post/show/post_show_model.dart';

class PostListItem extends StatelessWidget {
  final Post item;
  final PostListLayout layout;

  PostListItem({
    required this.item,
    this.layout = PostListLayout.stack, // 设置layout默认值
  });

  @override
  Widget build(BuildContext context) {
    final appModel =  context.read<AppModel>();
    final postShowModel = context.read<PostShowModel>();

    final postListItemMediaMask = Positioned.fill(child: Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Colors.blueGrey.withOpacity(0.2),
        onTap: () {
          appModel.setPageName('PostShow'); //设置路由
          appModel.setResourceId('${item.id}'); //设置postId
          postShowModel.setPost(item); // 传递post信息
        },
      ),
    ));

    final postListItemMedia = Stack(
      fit: layout == PostListLayout.grid ? StackFit.expand : StackFit.loose,
      children: [
        PostMedia(post: item),
        postListItemMediaMask,
      ],
    );
    
    // layout stack 布局 
    final stackContainer = Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(children: [
        postListItemMedia,
        SizedBox(height: 8,),
        PostHeader(post: item),
      ]),
    );

    // layout grid 布局
    final gridContainer = Container(
      child: postListItemMedia,
    );

    Widget ItemContainer = stackContainer;

    if(layout == PostListLayout.grid) {
      ItemContainer = gridContainer;
    }

    return ItemContainer;
  }
}
