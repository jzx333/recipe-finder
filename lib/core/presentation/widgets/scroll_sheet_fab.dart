import 'package:flutter/material.dart';

class ScrollSheetFab extends StatelessWidget {
  final Function() onPressed;

  const ScrollSheetFab({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FloatingActionButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 0,
      highlightElevation: 0,
      child: Icon(
        Icons.arrow_upward,
        color: Colors.black.withValues(alpha: 0.5),
      ),
    );
  }
}
