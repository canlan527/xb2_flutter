import 'package:flutter/material.dart';
import 'package:xb2_flutter/app/components/app_bottom_sheet.dart';

class AppSharedButton extends StatefulWidget {
  @override
  State<AppSharedButton> createState() => _AppSharedButtonState();
}

class _AppSharedButtonState extends State<AppSharedButton> {

  // 是否正在显示底部面板
  bool isBottomSheetShown = false;

  // 设置不同状态返回的图标
  Icon floatingActionButtonIcon() {
    return isBottomSheetShown ? const Icon(Icons.close) : const Icon(Icons.share_outlined);
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // 关闭底部面板
        if(isBottomSheetShown) {
          return Navigator.pop(context);
        }
        // 显示底部面板
        final bottomSheetController = showBottomSheet(
          context: context, 
          builder: (context) => AppBottomSheet()
        );
        // 
        setState(() {
          isBottomSheetShown = true;
        });

        // 关闭底部面板以后
        bottomSheetController.closed.then((value) {
          setState(() {
            isBottomSheetShown = false;
          });
        });
      },
      backgroundColor: Colors.amber.shade900,
      foregroundColor: Colors.white,
      child: floatingActionButtonIcon(),
    );
  }
}
