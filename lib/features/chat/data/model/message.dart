class Message {
  Message(this.role, this.content);

  Message.fromJson(Map<String, dynamic> json)
      : role = json['role'],
        content = json['content'];

  Map<String, dynamic> toJson() => {
        'role': role,
        'content': content,
      };

  final String role;
  final String content;
}
