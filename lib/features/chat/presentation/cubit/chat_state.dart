part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatResult extends ChatState {
  ChatResult(this.messages);

  final List<Message> messages;
}

final class ChatError extends ChatState {
  ChatError(this.error);

  final String error;
}
