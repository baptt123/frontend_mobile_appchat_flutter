import 'package:json_annotation/json_annotation.dart';
class Post{
int id;
String content;
int user_id;
Post({required this.id, required this.content, required this.user_id});
}