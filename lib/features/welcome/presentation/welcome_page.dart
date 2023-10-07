import 'package:chat_gpt/features/welcome/presentation/strings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../shared/images.dart';
import '../../../shared/strings.dart';
import '../../../shared/themes/colors.dart';
import '../../../shared/themes/spacing.dart';
import '../../../shared/widgets/info_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.only(
              top: spacingS, left: spacingS, right: spacingS),
          child: Stack(children: [
            ListView(
              children: [
                Text(
                  pageTitle,
                  style: textTheme.headlineLarge,
                ),
                Container(
                  margin: const EdgeInsets.only(top: spacingXL),
                  child: Text(
                    pageDescription,
                    style: textTheme.bodyMedium,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: spacingXXL),
                    child: InfoWidget(
                        title: infoTitle1,
                        description: infoDescription1,
                        icon: globeImage)),
                Container(
                    margin: const EdgeInsets.only(top: spacingXXL),
                    child: InfoWidget(
                        title: infoTitle2,
                        description: infoDescription2,
                        icon: lockImage)),
                Container(
                    margin: const EdgeInsets.only(top: spacingXXL),
                    child: InfoWidget(
                      title: infoTitle3,
                      description: infoDescription3,
                      icon: slidersImage,
                    )),
                const SizedBox(
                  height: 70,
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(bottom: spacingS),
              alignment: Alignment.bottomCenter,
              child: FilledButton.tonal(
                  style: FilledButton.styleFrom(
                      minimumSize: const Size.fromHeight(spacingUL)),
                  onPressed: () => context.pushNamed(routerChat),
                  child: Text(
                    buttonText,
                    style: textTheme.bodyMedium
                        ?.copyWith(fontSize: 14, color: textButtonColor),
                  )),
            ),
          ])),
    );
  }
}
