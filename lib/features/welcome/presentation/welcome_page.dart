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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(builder:
            (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Text(
                      pageTitle,
                      style: textTheme.headlineLarge,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 27),
                      child: Text(
                        pageDescription,
                        style: textTheme.bodyMedium,
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: const InfoWidget(
                            title: infoTitle1,
                            description: infoDescription1,
                            iconPath: 'icons/globe.png')),
                    Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: const InfoWidget(
                            title: infoTitle2,
                            description: infoDescription2,
                            iconPath: 'icons/lock.png')),
                    Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: const InfoWidget(
                          title: infoTitle3,
                          description: infoDescription3,
                          iconPath: 'icons/sliders.png',
                        )),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: FilledButton.tonal(
                          style: FilledButton.styleFrom(
                              minimumSize: const Size.fromHeight(40)),
                          onPressed: () => context.pushNamed(routerChat),
                          child: Text(
                            buttonText,
                            style: textTheme.bodyMedium?.copyWith(
                                fontSize: 14, color: const Color(0xff343345)),
                          )),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
