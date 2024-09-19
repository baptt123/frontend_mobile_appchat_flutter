class Message {
  int? id;
  String? content;

  Message({required this.id, required this.content});

  Map<String, dynamic>? toJson() {
    return {'id': id, 'content': content};
  }
}
