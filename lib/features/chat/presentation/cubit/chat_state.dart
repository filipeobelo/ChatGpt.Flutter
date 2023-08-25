part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatResult extends ChatState {
  ChatResult(this.message);

  final String message;
}
