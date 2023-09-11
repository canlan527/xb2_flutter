import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

@JsonSerializable(explicitToJson: true)
class Post {
  int? id;
  String? title;
  String? content;
  PostUser? user;
  String? status;
  int? totalComments;
  List<PostTag>? tags;
  int? totalLikes;
  int? liked;
  PostFile? file;
  

  Post({
    this.id,
    this.content,
    this.title,
    this.user,
    this.status,
    this.totalComments,
    this.totalLikes,
    this.liked,
    this.file,
    this.tags
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return _$PostFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PostUser {
  int? id;
  String? name;
  int? avatar;


  PostUser({
    this.id,
    this.name,
    this.avatar
  });

  factory PostUser.fromJson(Map<String, dynamic> json) {
    return _$PostUserFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostUserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PostTag {
  int? id;
  String? name;

  PostTag({
    this.id,
    this.name,
  });

  factory PostTag.fromJson(Map<String, dynamic> json) {
    return _$PostTagFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostTagToJson(this);
}

@JsonSerializable(explicitToJson: true)
class PostFile {
  int? id;
  int? width;
  int? height;

  PostFile({
    this.id,
    this.width,
    this.height,    
  });

  factory PostFile.fromJson(Map<String, dynamic> json) {
    return _$PostFileFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PostFileToJson(this);
}