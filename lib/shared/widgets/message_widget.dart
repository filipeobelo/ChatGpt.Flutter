import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget(
      {super.key,
      required this.fullName,
      required this.message,
      this.nameInitials,
      this.picture});

  final String fullName;
  final String? nameInitials;
  final String message;
  final Image? picture;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final CircleAvatar avatar;
    if (picture != null) {
      avatar = CircleAvatar(
        radius: 12.5,
        child: picture,
      );
    } else {
      avatar = CircleAvatar(
        radius: 12.5,
        backgroundColor: Colors.grey,
        child: Text(nameInitials ?? ''),
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        avatar,
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 8,
              ),
              Text(
                fullName,
                style: textTheme.labelSmall,
              ),
              Text(
                message,
                style: textTheme.bodyMedium?.copyWith(color: Colors.black),
              )
            ],
          ),
        )
      ],
    );
  }
}
