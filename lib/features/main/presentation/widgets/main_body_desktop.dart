import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/recipe_list.dart';
import 'package:recipe_finder_demo/features/main/presentation/widgets/top_info.dart';

class MainBodyDesktop extends StatelessWidget {
  const MainBodyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 10,
      children: [
        TopInfo(),
        Expanded(
          child: RecipeList(
            borderRadius: 0,
          ),
        )
      ],
    );
  }
}
