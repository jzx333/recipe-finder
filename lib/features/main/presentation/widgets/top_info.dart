import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/tag_entity.dart';
import 'package:recipe_finder_demo/core/domain/repositories/recipe_repository.dart';
import 'package:recipe_finder_demo/core/themes/themes.dart';
import 'package:recipe_finder_demo/di.dart';
import 'package:recipe_finder_demo/features/main/presentation/widgets/main_search_button.dart';
import 'package:recipe_finder_demo/features/main/presentation/widgets/main_tag_button.dart';
import 'package:recipe_finder_demo/features/main/presentation/widgets/tag_list.dart';

class TopInfo extends StatelessWidget {
  const TopInfo({
    super.key,
  });

  static const height = 270.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: theme.horizontalPadding),
      child: Column(
        children: [
          const MainSearchButton(),
          const SizedBox(height: 8.0),
          Row(
            children: [
              MainTagButton(
                isSelected: true,
                onPressed: () {},
                text: "Завтрак",
              ),
              MainTagButton(
                isSelected: false,
                onPressed: () async {},
                text: "Обед",
              ),
              MainTagButton(
                isSelected: false,
                onPressed: () {},
                text: "Ужин",
              ),
            ],
          ),
          const SizedBox(height: 8),
          const TagList(),
        ],
      ),
    );
  }
}
