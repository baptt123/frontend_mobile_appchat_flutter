class MessageApp {
  int? id;
  String? content;

  MessageApp({required this.id, required this.content});

  Map<String, dynamic>? toJson() {
    return {'id': id, 'content': content};
  }
}
