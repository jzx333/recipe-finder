import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';

class SmallTag extends StatelessWidget {
  const SmallTag({super.key, required this.tag});

  final TagEntity tag;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2),
      width: 68,
      height: 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: theme.primaryColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        tag.name,
        style: theme.textTheme.bodySmall,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
