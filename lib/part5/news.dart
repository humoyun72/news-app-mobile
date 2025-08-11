import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News {
  final String title;
  final String description;
  final String content;
  @JsonKey(name: 'image')
  final String imageUrl;

  News(this.description, this.content, this.imageUrl, {required this.title});
  static News fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}