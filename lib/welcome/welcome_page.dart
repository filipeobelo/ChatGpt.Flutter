import 'package:chat_gpt/components/info_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to ChatGPT',
            style: textTheme.headlineLarge,
          ),
          Text(
            'This official app is free, syncs your history accors devices and brings you the latest model improvements from OpenAI.',
            style: textTheme.titleMedium,
          ),
          const InfoWidget(
              title: 'ChatGPT can be inaccurate',
              description:
                  'ChatGPT may provide inaccurate information about people, places, or facts',
              icon: Icon(Icons.language, color: Colors.green)),
          const InfoWidget(
              title: 'Don’t share sensitive info',
              description:
                  'Chats may be reviewed by our AI trainers to improve our system',
              icon: Icon(Icons.lock, color: Colors.purple)),
          const InfoWidget(
              title: 'Control your chat history',
              description:
                  'Decide whether new chats on this device will appear in your history and be used to improve our systems',
              icon: Icon(Icons.tune, color: Colors.black)),
          ElevatedButton(
              onPressed: () => context.pushNamed('chatPage'),
              child: const Text('Abrir chat')),
        ],
      )),
    );
  }
}
