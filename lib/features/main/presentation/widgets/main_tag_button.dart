import 'package:flutter/material.dart';

class MainTagButton extends StatelessWidget {
  const MainTagButton({
    super.key,
    required this.isSelected,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final bool isSelected;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme =
        isSelected ? theme.textTheme.bodyLarge : theme.textTheme.headlineLarge;
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: textTheme),
    );
  }
}
