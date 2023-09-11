import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xb2_flutter/post/index/components/post_list_item.dart';
import 'package:xb2_flutter/post/index/post_index_model.dart';

class PostList extends StatefulWidget {
  final String? sort;

  PostList({this.sort});

  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  restoreLayout() async {
    // 拿到缓存实例
    final prefs = await SharedPreferences.getInstance();
    // 取出layout数据
    final data = prefs.getString('postListLayout');
    // 赋值layout
    if(data != null) {
      PostListLayout layout = PostListLayout.values
        .firstWhere((element) => element.toString() == data);

      context.read<PostIndexModel>().setLayout(layout);

    }

    
    
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<PostIndexModel>().getPosts(sort: widget.sort ?? 'latest'));

    // 恢复布局
    restoreLayout();
  }

  @override
  Widget build(BuildContext context) {
    // 获取 PostIndexModel类
    final model = context.watch<PostIndexModel>();
    // 获取post
    final posts = model.posts ?? [];
    // 构建暂无内容
    final noContent = Center(
      child: Container(child: Text('暂无内容')),
    );
    // 构建列表视图
    final stacklist = ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostListItem(item: posts[index]);
        });

    final gridlist = GridView.builder(
        itemCount: posts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return PostListItem(
            item: posts[index],
            layout: PostListLayout.grid,
          );
        });

    Widget postList = stacklist;

    if (model.layout == PostListLayout.grid) {
      postList = gridlist;
    }

    return posts.length == 0 ? noContent : postList;
  }
}
