import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
}
