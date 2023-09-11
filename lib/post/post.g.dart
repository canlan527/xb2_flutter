// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int?,
      content: json['content'] as String?,
      title: json['title'] as String?,
      user: json['user'] == null
          ? null
          : PostUser.fromJson(json['user'] as Map<String, dynamic>),
      status: json['status'] as String?,
      totalComments: json['totalComments'] as int?,
      totalLikes: json['totalLikes'] as int?,
      liked: json['liked'] as int?,
      file: json['file'] == null
          ? null
          : PostFile.fromJson(json['file'] as Map<String, dynamic>),
      tags: (json['tags'] as List<dynamic>?)
          ?.map((e) => PostTag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'user': instance.user?.toJson(),
      'status': instance.status,
      'totalComments': instance.totalComments,
      'tags': instance.tags?.map((e) => e.toJson()).toList(),
      'totalLikes': instance.totalLikes,
      'liked': instance.liked,
      'file': instance.file?.toJson(),
    };

PostUser _$PostUserFromJson(Map<String, dynamic> json) => PostUser(
      id: json['id'] as int?,
      name: json['name'] as String?,
      avatar: json['avatar'] as int?,
    );

Map<String, dynamic> _$PostUserToJson(PostUser instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
    };

PostTag _$PostTagFromJson(Map<String, dynamic> json) => PostTag(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PostTagToJson(PostTag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

PostFile _$PostFileFromJson(Map<String, dynamic> json) => PostFile(
      id: json['id'] as int?,
      width: json['width'] as int?,
      height: json['height'] as int?,
    );

Map<String, dynamic> _$PostFileToJson(PostFile instance) => <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
    };
