import 'package:chat_gpt/features/chat/data/choices.dart';

class CompletionsOutput {
  CompletionsOutput(this.id, this.created, this.choices);

  CompletionsOutput.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        created = json['created'],
        choices = Choice.fromJsonList(json['choices']);

  final String id;
  final int created;
  final List<Choice> choices;
}
