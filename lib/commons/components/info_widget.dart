import 'package:flutter/material.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.icon});

  final String title;
  final String description;
  final ImageIcon icon;
  
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(children: [
      Row(
        children: [
          icon,
          Text(
            title,
            style: textTheme.titleMedium,
          )
        ],
      ),
      Text(
        description,
        style: textTheme.bodyMedium,
      )
    ]);
  }
}
