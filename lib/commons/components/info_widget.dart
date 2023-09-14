import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.iconPath});

  final String title;
  final String description;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Image.asset(iconPath),
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: textTheme.titleMedium,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                description,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
