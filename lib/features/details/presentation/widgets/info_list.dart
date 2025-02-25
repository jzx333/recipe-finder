import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/themes/themes.dart';

class InfoList extends StatelessWidget {
  const InfoList({
    super.key,
    required this.borderRadius,
    this.scrollController,
    required this.info,
  });

  final double borderRadius;
  final ScrollController? scrollController;
  final Widget info;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(borderRadius),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: theme.horizontalPadding),
        child: SingleChildScrollView(
          controller: scrollController,
          child: info,
        ),
      ),
    );
  }
}
