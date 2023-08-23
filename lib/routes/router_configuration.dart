import 'package:chat_gpt/features/chat/presentation/chat_page.dart';
import 'package:go_router/go_router.dart';
import '../features/welcome/presentation/welcome_page.dart';

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