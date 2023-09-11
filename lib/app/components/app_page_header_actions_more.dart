import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/post/index/post_index_model.dart';

class AppPageHeaderActionsMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 引入provider的modal
    final postIndexModal = context.watch<PostIndexModel>();

    return PopupMenuButton(
      icon: const Icon(Icons.more_horiz),
      offset: const Offset(0, 50),
      onCanceled: () {
        print('popupMenuButton: onCanceled');
      },
      onSelected: (value) {
        // 设置并存储布局方式
        postIndexModal.storeLayout(value);
        print('popupMenuButton: onSelected: $value');
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: PostListLayout.stack,
          child: Row(
            children: [
              Icon(
                Icons.view_agenda_outlined,
                color: postIndexModal.layout == PostListLayout.stack
                    ? Theme.of(context).primaryColor
                    : Colors.black54,
              ),
              const SizedBox(
                width: 8,
              ),
              Text('列表', style: TextStyle( color: postIndexModal.layout == PostListLayout.stack
                    ? Theme.of(context).primaryColor
                    : Colors.black54,),)
            ],
          ),
        ),
        PopupMenuItem(
          value: PostListLayout.grid,
          child: Row(
            children: [
              Icon(
                Icons.grid_view,
                color: postIndexModal.layout == PostListLayout.grid
                    ? Theme.of(context).primaryColor
                    : Colors.black54,
              ),
              const SizedBox(
                width: 8,
              ),
              Text('网格', style: TextStyle(color: postIndexModal.layout == PostListLayout.grid
                    ? Theme.of(context).primaryColor
                    : Colors.black54,),)
            ],
          ),
        ),
      ],
    );
  }
}
