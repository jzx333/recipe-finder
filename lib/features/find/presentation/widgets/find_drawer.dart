import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';
import 'package:recipe_finder_demo/features/find/presentation/notifier/find_notifier.dart';

class FindDrawer extends StatelessWidget {
  const FindDrawer(
      {super.key,
      required this.tags,
      required this.selectedTags,
      this.budget,
      this.calories,
      this.time});

  final List<TagEntity> tags;
  final List<TagEntity> selectedTags;
  final int? budget;
  final int? calories;
  final int? time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final findNotifier = context.read<FindNotifier>();
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          const SizedBox(height: 10),
          TextFormField(
            initialValue: budget?.toString() ?? "",
            style: const TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
            onChanged: (value) {
              findNotifier.setBudget(int.tryParse(value.trim()));
            },
            decoration: InputDecoration(
              hintText: "Введите желаемый бюджет руб.",
              hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0x80181818),
                  fontWeight: FontWeight.w400),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            initialValue: calories?.toString() ?? "",
            style: const TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
            onChanged: (value) {
              findNotifier.setCalories(int.tryParse(value.trim()));
            },
            decoration: InputDecoration(
              hintText: "Введите количество калорий кКал.",
              hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0x80181818),
                  fontWeight: FontWeight.w400),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextFormField(
            initialValue: time?.toString() ?? "",
            style: const TextStyle(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w400),
            onChanged: (value) {
              findNotifier.setTime(int.tryParse(value.trim()));
            },
            decoration: InputDecoration(
              hintText: "Введите время приготовления мин.",
              hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0x80181818),
                  fontWeight: FontWeight.w400),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: theme.primaryColor, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 10),
          GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisExtent: 90,
            ),
            shrinkWrap: true,
            children: tags
                .map(
                  (tag) => _TagTile(
                    isSelected: selectedTags.contains(tag),
                    tag: tag,
                    onTap: () {
                      context.read<FindNotifier>().toggleFilterTag(tag);
                    },
                  ),
                )
                .toList(),
          )
        ],
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
        SizedBox(
          width: 50,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(20),
              child: Ink(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: isSelected
                      ? theme.primaryColor
                      : theme.colorScheme.outline,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    tag.emoji,
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          tag.name,
          style: theme.textTheme.displaySmall,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
