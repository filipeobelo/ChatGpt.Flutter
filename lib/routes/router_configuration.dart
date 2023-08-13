import 'package:chat_gpt/chat/chat_page.dart';
import 'package:chat_gpt/main.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      name: 'welcomePage',
      path: '/',
      builder: (context, state) => const MyHomePage(),
    ),
    GoRoute(
      name: 'chatPage',
      path: '/chat',
      builder: (context, state) => const ChatPage(),
      )
  ],
);