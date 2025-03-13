import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';
import 'package:recipe_finder_demo/features/main/presentation/notifier/main_notifier.dart';
import 'package:recipe_finder_demo/features/main/presentation/notifier/main_state.dart';

class TagList extends StatelessWidget {
  const TagList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mainNotifier = context.watch<MainNotifier>();
    assert(mainNotifier.state is MainStateLoaded, "can not show tags in not loaded state");

    final tags = (mainNotifier.state as MainStateLoaded).tags;
    final filterTags = (mainNotifier.state as MainStateLoaded).filterTags;

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
        itemCount: tags.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final tag = tags[index];
          return _TagTile(
            isSelected: filterTags.contains(tag),
            tag: tag,
            onTap: () {
              mainNotifier.toggleFilterTag(tag);
            },
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
    required this.tag,
    required this.onTap,
  });

  final bool isSelected;
  final TagEntity tag;
  final VoidCallback onTap;

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
              child: Center(
                child: Text(
                  tag.emoji,
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Center(
          child: Text(
            tag.name,
            style: theme.textTheme.displaySmall,
          ),
        )
      ],
    );
  }
}
