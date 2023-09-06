import 'package:bloc/bloc.dart';
import 'package:chat_gpt/features/chat/data/model/completions_input.dart';
import 'package:chat_gpt/features/chat/data/model/message.dart';
import 'package:chat_gpt/features/chat/strings.dart';
import 'package:flutter/material.dart';

import '../../data/service/chat_service.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.service}) : super(ChatInitial());

  final ChatService service;
  final _messages = List<Message>.empty(growable: true);

  void sendMessage(String userMessage) async {
    try {
      _messages.add(Message(roleInput, userMessage));
      final userMessages =
          _messages.where((element) => element.role == roleInput).toList();
      final chatData = await service
          .sendCompletion(CompletionsInput('gpt-3.5-turbo', userMessages, 0.7));
      _messages.add(Message(roleOutput, chatData.choices[0].message.content));
      emit(ChatResult(_messages));
    } catch (error) {
      emit(ChatError(error.toString()));
    }
  }
}
