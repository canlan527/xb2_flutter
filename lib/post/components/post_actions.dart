import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/exceptions/http_exception.dart';
import 'package:xb2_flutter/like/create/like_create_modal.dart';
import 'package:xb2_flutter/like/destory/like_destory_modal.dart';
import 'package:xb2_flutter/post/post.dart';

class PostActions extends StatelessWidget {
  final Post post;

  PostActions({
    required this.post,
  });

  increaseTotalLikes() {
    post.totalLikes = post.totalLikes! + 1;
  }

  decreaseTotalLikes() {
    post.totalLikes = post.totalLikes != 0 ? post.totalLikes! - 1 : 0;
  }

  liked() {
    post.liked = 1;
    increaseTotalLikes();
  }

  disliked() {
    post.liked = 0;
    decreaseTotalLikes();
  }
  @override
  Widget build(BuildContext context) {
    final likeCreateModal = context.watch<LikeCreateModal>();
    final likeDestoryModal = context.watch<LikeDestoryModal>();

    onTapLikeAction() async {
      if(post.liked == 0) {
        try {
          await likeCreateModal.createUserLikePost(post.id!);
          liked();
        } on HttpException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message)),
          );
        }
      } else {
        try {
          await likeDestoryModal.deleteUserLikePost(post.id!);
          disliked();
        } on HttpException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message)),
          );
        }
      }
    }

    final iconFavorite_Outlined = Icon(Icons.favorite_border_outlined);
    final iconFavorite = Icon(Icons.favorite, color: Colors.deepOrange,);

    final likeAction = Row(
      children: [
        GestureDetector(
          onTap: onTapLikeAction,
          child: post.liked == 0 ? iconFavorite_Outlined : iconFavorite,
        ),
        if (post.totalLikes != 0)
          Container(
            padding: EdgeInsets.only(left: 4),
            child: Text('${post.totalLikes}'),
          )
      ],
    );
    final commentAction = Row(
      children: [
        Icon(Icons.mode_comment_outlined),
        if (post.totalComments != 0)
          Container(
            padding: EdgeInsets.only(left: 4),
            child: Text('${post.totalComments}'),
          )
      ],
    );

    return Container(
      child: Row(
        children: [
          likeAction,
          SizedBox(
            width: 16,
          ),
          commentAction,
        ],
      ),
    );
  }
}
