// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
  json['description'] as String,
  json['content'] as String,
  json['image'] as String,
  title: json['title'] as String,
);

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'content': instance.content,
  'image': instance.imageUrl,
};
