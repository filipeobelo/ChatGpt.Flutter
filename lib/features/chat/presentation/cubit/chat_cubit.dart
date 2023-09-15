import 'package:bloc/bloc.dart';
import 'package:chat_gpt/features/chat/data/model/message.dart';
import 'package:chat_gpt/features/chat/domain/chat_use_case.dart';
import 'package:chat_gpt/features/chat/strings.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

part 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._useCase) : super(ChatInitial());

  final ChatUseCase _useCase;
  final _messages = List<Message>.empty(growable: true);

  void sendMessage(String userMessage) async {
    try {
      _messages.add(Message(roleInput, userMessage));
      final userMessages =
          _messages.where((element) => element.role == roleInput).toList();
      emit(ChatResult(_messages));
      final chatData = await _useCase.sendUserMessages(userMessages);
      _messages.add(Message(roleOutput, chatData.choices[0].message.content));
      emit(ChatResult(_messages));
    } catch (error) {
      emit(ChatError(error.toString()));
    }
  }
}
