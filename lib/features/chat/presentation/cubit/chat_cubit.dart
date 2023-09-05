import 'package:bloc/bloc.dart';
import 'package:chat_gpt/features/chat/data/completions_input.dart';
import 'package:chat_gpt/features/chat/data/message.dart';
import 'package:flutter/material.dart';

import '../../data/completions_output.dart';
import '../../data/service/chat_service.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.service}) : super(ChatInitial());

  final ChatService service;

  void sendMessage() async {
    try {
      // mock for test purpose
      final chatData = await service.sendCompletion(CompletionsInput(
          'gpt-3.5-turbo', [Message('user', 'Say this is a test!')], 0.7));
      emit(ChatResult(chatData));
    } catch (error) {
      print('Deu erro aqui: $error');
    }
  }
}
