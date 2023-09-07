import 'package:chat_gpt/features/chat/data/service/chat_service.dart';
import 'package:chat_gpt/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(service: ChatServiceImpl()),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Column(
            children: [
              TextField(
                controller: textController,
              ),
              Expanded(
                child: BlocBuilder<ChatCubit, ChatState>(
                  builder: (context, state) {
                    switch (state) {
                      case ChatInitial():
                        return const Text('Say something to me!');
                      case ChatResult():
                        return ListView.builder(
                            itemCount: state.messages.length,
                            itemBuilder: (context, index) {
                              final item = state.messages[index];

                              return Text('${item.role}: ${item.content}');
                            });
                      case ChatError():
                        return Text(state.error);
                    }
                  },
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
              child: const Text('oi'),
              onPressed: () {
                context.read<ChatCubit>().sendMessage(textController.text);
                textController.value = TextEditingValue.empty;
              }),
        );
      }),
    );
  }
}
