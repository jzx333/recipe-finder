import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';

class TagList extends StatelessWidget {
  const TagList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 100,
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        color: theme.colorScheme.primaryContainer,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: 8,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _TagTile(
            isSelected: index == 0,
            text: "Жареное",
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 20);
        },
      ),
    );
  }
}

class _TagTile extends StatelessWidget {
  const _TagTile({
    required this.isSelected,
    required this.text,
    required this.onTap,
  });

  final bool isSelected;
  final String text;
  final VoidCallback onTap;

  // final String asset;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(20),
            child: Ink(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color:
                    isSelected ? theme.primaryColor : theme.colorScheme.outline,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.ac_unit),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          text,
          style: theme.textTheme.displaySmall,
        )
      ],
    );
  }
}
