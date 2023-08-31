import 'package:chat_gpt/features/chat/data/service/chat_service.dart';
import 'package:chat_gpt/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(service: ChatServiceImpl())..sendMessage(),
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ChatCubit, ChatState>(
              builder: (context, state) {
                switch (state.runtimeType) {
                  case ChatResult:
                    state as ChatResult;
                    return Text(state.chatResult.fact);
                  default:
                    return const Text('Initial State');
                }
              },
            ),
          ],
        )),
      ),
    );
  }
}
