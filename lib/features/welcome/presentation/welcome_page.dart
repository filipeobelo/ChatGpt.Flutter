import 'package:chat_gpt/commons/components/info_widget.dart';
import 'package:chat_gpt/features/welcome/presentation/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../commons/strings.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            pageTitle,
            style: textTheme.headlineLarge,
          ),
          Text(
            pageDescription,
            style: textTheme.titleMedium,
          ),
          const InfoWidget(
              title: infoTitle1,
              description: infoDescription1,
              icon: ImageIcon(AssetImage('icons/globe.png'),
                  color: Color(0xff1DC27D))),
          const InfoWidget(
              title: infoTitle2,
              description: infoDescription2,
              icon: ImageIcon(AssetImage('icons/lock.png'),
                  color: Color(0xff8783FF))),
          const InfoWidget(
              title: infoTitle3,
              description: infoDescription3,
              icon: ImageIcon(AssetImage('icons/sliders.png'),
                  color: Color(0xff000000))),
          ElevatedButton(
              onPressed: () => context.pushNamed(routerChat),
              child: const Text(buttonText)),
        ],
      )),
    );
  }
}
