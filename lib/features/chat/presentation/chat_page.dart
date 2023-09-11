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
              Expanded(
                child: BlocBuilder<ChatCubit, ChatState>(
                  builder: (context, state) {
                    switch (state) {
                      case ChatInitial():
                        return const Image(
                            image: AssetImage('images/gpt_logo.png'));
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
              ),
              Container(
                margin: const EdgeInsets.only(right: 16, left: 16, bottom: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.mic),
                            hintText: 'Message',
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(25)),
                            filled: true,
                            fillColor:
                                Theme.of(context).colorScheme.primaryContainer),
                      ),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    IconButton.filledTonal(
                        onPressed: () {
                          context
                              .read<ChatCubit>()
                              .sendMessage(textController.text);
                          textController.value = TextEditingValue.empty;
                        },
                        icon: const Icon(Icons.arrow_upward))
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
