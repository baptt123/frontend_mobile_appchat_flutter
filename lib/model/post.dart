import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';
@JsonSerializable()
class Post{
int id;
String content;
int user_id;

Post({required this.id, required this.content, required this.user_id});
factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
Map<String, dynamic> toJson() => _$PostToJson(this);

}