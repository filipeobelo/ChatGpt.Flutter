import 'package:chat_gpt/commons/themes/colors.dart';
import 'package:chat_gpt/injection.dart';
import 'package:flutter/material.dart';
import 'routes/router_configuration.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ChatGPT',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
          fontFamily: 'Inter',
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
                fontSize: 45, fontWeight: FontWeight.w500, color: Colors.black),
            bodyMedium: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: textMediumColor),
            titleMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: textMediumColor,
            ),
          ),
          iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(secondaryColor)))),
      routerConfig: router,
    );
  }
}
