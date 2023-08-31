import 'package:bloc/bloc.dart';
import 'package:chat_gpt/features/chat/data/chat_data.dart';
import 'package:chat_gpt/features/chat/data/service/chat_service.dart';
import 'package:flutter/material.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({required this.service}) : super(ChatInitial());

  final ChatService service;

  void sendMessage() async {
    final chatData = await service.sendMessage();
    emit(ChatResult(chatData));
  }
}
