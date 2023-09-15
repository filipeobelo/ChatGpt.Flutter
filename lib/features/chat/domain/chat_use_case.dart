import 'package:chat_gpt/features/chat/data/repository/chat_repository.dart';
import 'package:injectable/injectable.dart';

import '../data/model/completions_input.dart';
import '../data/model/completions_output.dart';
import '../data/model/message.dart';

abstract class ChatUseCase {
  Future<CompletionsOutput> sendUserMessages(List<Message> messages);
}

@Injectable(as: ChatUseCase)
class ChatUseCaseImpl implements ChatUseCase {
  const ChatUseCaseImpl(this._repository);

  final ChatRepository _repository;

  @override
  Future<CompletionsOutput> sendUserMessages(List<Message> messages) =>
      _repository
          .sendCompletion(CompletionsInput('gpt-3.5-turbo', messages, 0.7));
}
