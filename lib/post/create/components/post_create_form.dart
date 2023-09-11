import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/app/components/app_button.dart';
import 'package:xb2_flutter/app/components/app_text_field.dart';
import 'package:xb2_flutter/app/exceptions/app_exception.dart';
import 'package:xb2_flutter/app/exceptions/validate_exception.dart';
import 'package:xb2_flutter/post/create/components/post_create_media.dart';
import 'package:xb2_flutter/post/create/post_create_model.dart';

class PostCreateForm extends StatefulWidget {
  @override
  _PostCreateFormState createState() => _PostCreateFormState();
}

class _PostCreateFormState extends State<PostCreateForm> {
  // 准备表单key
  final formKey = GlobalKey<FormState>();

  // 是否自动验证
  bool canValidate = true;

  // 文本编辑控制器
  final titleFieldController = TextEditingController();
  final contentFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final title = context.read<PostCreateModel>().title;
    final content = context.read<PostCreateModel>().content;

    if(title != null) {
      titleFieldController.text = title;
    }

    if(content != null) {
      contentFieldController.text = content;
    }
  }

  @override
  Widget build(BuildContext context) {
    // 获取modal
    final postCreateModel = context.watch<PostCreateModel>();

    // 选择文件后设置标题
    if(postCreateModel.selectedFile != null && postCreateModel.title == null) {
      // 使用split将selectedFile变成列表List类型，用点.分割，第一项是名字，第二项是后缀名
      final title = postCreateModel.selectedFile!.name.split('.')[0];
      titleFieldController.text = title;
      postCreateModel.setTitle(title);
    }

    // 标题字段
    final titleField = AppTextField(
      labelText: '标题',
      controller: titleFieldController,
      enabled: !postCreateModel.loading,
      canValidate: canValidate,
      onChanged: (value) {
        postCreateModel.setTitle(value);
      },
    );

    // 正文字段
    final contentFiled = AppTextField(
      labelText: '内容',
      controller: contentFieldController,
      enabled: !postCreateModel.loading,
      canValidate: canValidate,
      isMultiline: true,
      onChanged: (value) {
        postCreateModel.setContent(value);
      },
    );

    // 验证表单
    validate() {
      final isValid = formKey.currentState!.validate();
      if(!isValid) {
        throw ValidateException();
      }
    }

    // 重置表单
    reset() {
      setState(() {
        titleFieldController.text = '';
        contentFieldController.text = '';
        canValidate = false;
        postCreateModel.reset();
      });
    }

    // 提交方法
    submitCreatePost() async {
      try {
        // 验证
        validate();
        // 设置loading
        postCreateModel.setLoading(true);
        // 创建请求内容
        final postId = await postCreateModel.createPost();
        // 上传图像文件
        await postCreateModel.createFile(postId: postId);
        // 成功提示
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('内容发布成功')),
        );
        // 重置
        reset();
      } on AppException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      } finally {
        postCreateModel.setLoading(false);
      }
    }

    // 提交按钮
    final submitButton = AppButton(
      text: '发布',
      onPressed: postCreateModel.loading ? null : submitCreatePost,
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostCreateMedia(),
          titleField,
          contentFiled,
          submitButton,
        ],
      )
    );
  }
}
