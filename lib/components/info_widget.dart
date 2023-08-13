import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.icon});

  final String title;
  final String description;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.titleMedium,
              textAlign: TextAlign.start,
            ),
            Text(
              description,
              style: textTheme.bodyMedium,
            )
          ],
        )
      ],
    );
  }
}
