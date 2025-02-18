import 'package:flutter/material.dart';

class ScrollSheetFab extends StatelessWidget {
  final ScrollController scrollController;
  final DraggableScrollableController sheetController;
  final double height;
  final double topHeight;

  const ScrollSheetFab({
    super.key,
    required this.scrollController,
    required this.sheetController,
    required this.height,
    required this.topHeight,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        await scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeIn,
        );
        await sheetController.animateTo(
          (height - topHeight) / height,
          duration: const Duration(milliseconds: 150),
          curve: Curves.easeOut,
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 0,
      highlightElevation: 0,
      child: Icon(
        Icons.arrow_upward,
        color: Colors.black.withOpacity(0.5),
      ),
    );
  }
}
