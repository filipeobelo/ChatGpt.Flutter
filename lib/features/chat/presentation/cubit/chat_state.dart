part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatResult extends ChatState {
  ChatResult(this.widgets);

  final List<ChatWidget> widgets;
}

final class ChatError extends ChatState {
  ChatError(this.error);

  final String error;
}

sealed class ChatWidget {}

class UserMessage extends ChatWidget {
  UserMessage(this.message);

  final Message message;
}

class SystemMessage extends ChatWidget {
  SystemMessage(this.message);

  final Message message;
}

class SpaceChatWidget extends ChatWidget {}
