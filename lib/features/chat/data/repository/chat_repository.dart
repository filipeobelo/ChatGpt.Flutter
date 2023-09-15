import 'package:chat_gpt/features/chat/data/service/chat_service.dart';
import 'package:injectable/injectable.dart';

import '../model/completions_input.dart';
import '../model/completions_output.dart';

abstract class ChatRepository {
  Future<CompletionsOutput> sendCompletion(CompletionsInput input);
}

@Injectable(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  const ChatRepositoryImpl(this._service);

  final ChatService _service;

  @override
  Future<CompletionsOutput> sendCompletion(CompletionsInput input) =>
      _service.sendCompletion(input);
}
