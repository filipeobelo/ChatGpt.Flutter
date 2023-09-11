import 'package:flutter/material.dart';
import 'routes/router_configuration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ChatGPT',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffE8EBFE)),
          useMaterial3: true,
          fontFamily: 'Inter',
          textTheme: const TextTheme(
            headlineLarge: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000)),
            bodyMedium: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Color(0xff716C72)),
            titleMedium: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xff716C72),
            ),
          ),
          iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xffECE6EA))))),
      routerConfig: router,
    );
  }
}
