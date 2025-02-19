import 'package:flutter/material.dart';

class ScrollSheetFab extends StatelessWidget {
  final Function() onPressed;

  const ScrollSheetFab({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 0,
      highlightElevation: 0,
      child: const Icon(
        Icons.arrow_upward,
      ),
    );
  }
}
