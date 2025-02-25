import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/recipe_list.dart';
import 'package:recipe_finder_demo/features/main/presentation/notifier/main_notifier.dart';
import 'package:recipe_finder_demo/features/main/presentation/notifier/main_state.dart';
import 'package:recipe_finder_demo/features/main/presentation/widgets/top_info.dart';

class MainBodyDesktop extends StatelessWidget {
  const MainBodyDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MainNotifier>(
      builder: (context, state, child) {
        return switch (state.state) {
          MainStateLoading s => const Center(
              child: CircularProgressIndicator(color: Colors.red),
            ),
          MainStateError s => Center(
              child: Text("Error ${s.err}"),
            ),
          MainStateLoaded s => Column(
              spacing: 30,
              children: [
                TopInfo(tags: s.tags),
                Expanded(
                  child: RecipeList(
                    borderRadius: 0,
                    recipes: s.recipes,
                    onRecipePressed: (recipe) {

                    },
                  ),
                )
              ],
            ),
        };
      },
    );
  }
}
