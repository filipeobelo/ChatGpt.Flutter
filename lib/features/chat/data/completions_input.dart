import 'dart:convert';

import 'package:chat_gpt/features/chat/data/message.dart';

class CompletionsInput {
  CompletionsInput(this.model, this.messages, this.temperature);

  Map<String, dynamic> toJson() => {
    'model' : model,
    'messages' : messages.map((message) => message.toJson()).toList(),
    'temperature' : temperature
  };

  final String model;
  final List<Message> messages;
  final double temperature;
}
