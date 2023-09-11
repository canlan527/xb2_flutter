import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xb2_flutter/post/create/post_create_model.dart';

class PostCreateMedia extends StatefulWidget {
  @override
  _PostCreateMediaState createState() => _PostCreateMediaState();
}

class _PostCreateMediaState extends State<PostCreateMedia> {
  @override
  Widget build(BuildContext context) {
    // 获取modal
    final postCreateModel = context.read<PostCreateModel>();

    selectFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image
      );
      if(result != null) {
        postCreateModel.setSelectedFile(result.files.first);
      }
    }

    final imagePlaceholder = AspectRatio(
      aspectRatio: 3/2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.add_a_photo_outlined,
          size: 56,
          color: Colors.black26,
        ),
      ),
    );

    final imagePlaceholderMask = Positioned.fill(
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.grey[400],
        onTap: postCreateModel.loading ? null : selectFile,
      )
    );

    final selectedImage = postCreateModel.selectedFile != null ? ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.file(
        File(postCreateModel.selectedFile!.path!),
      ),
    ) : null;

    final indicator = postCreateModel.loading ? CircularProgressIndicator(
      strokeWidth: 2,
    ) : null;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          imagePlaceholder,
          if(selectedImage != null) selectedImage,
          imagePlaceholderMask,
          if(indicator != null) indicator,
        ],
      ),
    );
  }
}