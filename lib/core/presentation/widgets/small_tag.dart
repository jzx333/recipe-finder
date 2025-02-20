import 'package:flutter/material.dart';

class SmallTag extends StatelessWidget {
  const SmallTag({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: 68,
      height: 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(4)
      ),
      child: Text(text, style: theme.textTheme.bodySmall),
    );
  }
}
