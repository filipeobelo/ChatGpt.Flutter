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
  final _messages = List<String>.empty(growable: true);

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(service: ChatServiceImpl()),
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: textController,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final item = _messages[index];

                    return Text(item);
                  }),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: const Text('oi'),
            onPressed: () {
              setState(() {
                _messages.add(textController.text);
              });
            }),
      ),
    );
  }
}
