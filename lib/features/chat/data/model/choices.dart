import 'package:chat_gpt/features/chat/data/model/message.dart';

class Choice {
  Choice(this.message, this.finishReason, this.index);

  Choice.fromJson(Map<String, dynamic> json)
      : message = Message.fromJson(json['message']),
        finishReason = json['finish_reason'],
        index = json['index'];

  static List<Choice> fromJsonList(List<dynamic> jsonList) =>
      List.from(jsonList.map((json) => Choice.fromJson(json)));

  final Message message;
  final String finishReason;
  final int index;
}
