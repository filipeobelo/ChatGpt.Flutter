import 'package:chat_gpt/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:chat_gpt/shared/widgets/message_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../shared/images.dart';
import '../strings.dart';

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
      create: (context) => GetIt.I.get<ChatCubit>(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: [
              BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  switch (state) {
                    case ChatInitial():
                      return const Image(
                          image: AssetImage('images/gpt_logo.png'));
                    case ChatResult():
                      return ListView.builder(
                          reverse: true,
                          itemCount: state.widgets.length,
                          itemBuilder: (context, index) {
                            final item = state.widgets[index];
                            switch (item) {
                              case UserMessage():
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 26, left: 16, right: 16),
                                  child: MessageWidget(
                                      fullName: fakeUserName,
                                      nameInitials: fakeUserInitials,
                                      message: item.message.content),
                                );
                              case SystemMessage():
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      top: 14, left: 16, right: 16),
                                  child: MessageWidget(
                                      fullName: systemName,
                                      message: item.message.content,
                                      picture: chatLogoImage),
                                );
                              case SpaceChatWidget():
                                return const SizedBox(
                                  height: 70,
                                );
                            }
                          });
                    case ChatError():
                      return Text(state.error);
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, left: 16, bottom: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.mic),
                            hintText: inputMessageHint,
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
