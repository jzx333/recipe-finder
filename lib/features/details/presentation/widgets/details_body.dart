import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_finder_demo/features/details/presentation/notifier/details_notifier.dart';
import 'package:recipe_finder_demo/features/details/presentation/notifier/details_state.dart';
import 'package:recipe_finder_demo/features/details/presentation/widgets/bottom_sheet_info_list.dart';
import 'package:recipe_finder_demo/features/details/presentation/widgets/ingredients_list.dart';
import 'package:recipe_finder_demo/features/details/presentation/widgets/steps_list.dart';
import 'package:recipe_finder_demo/features/details/presentation/widgets/top_photo_bar.dart';

class DetailsBody extends StatelessWidget {
  const DetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<DetailsNotifier>(
      builder: (context, state, child) {
        return switch (state.state) {
          DetailsStateLoading s => const Center(
              child: CircularProgressIndicator(),
            ),
          DetailsStateError s => Center(
              child: Text("Error ${s.err}"),
            ),
          DetailsStateLoaded s => Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: TopPhotoBar(asset: s.recipe.imgSrc),
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                ),
                BottomSheetInfoList(
                  topPadding: TopPhotoBar.height,
                  infoWidget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(s.recipe.name, style: theme.textTheme.titleLarge),
                      const SizedBox(height: 4),
                      Text(
                        "🔥 ${s.recipe.calories} кКал.",
                        style: theme.textTheme.displayMedium,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Время приготовления ~${s.recipe.time} минут",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "Порция на 2 человек",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        "Стоимость ~${s.recipe.budget} руб.",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("Ингредиенты", style: theme.textTheme.displayLarge),
                      const SizedBox(height: 8),
                      IngredientsList(ingredients: s.recipe.ingredients),
                      const SizedBox(height: 10),
                      Text("Пошаговый рецепт",
                          style: theme.textTheme.displayLarge),
                      const SizedBox(height: 8),
                      StepsList(steps: s.recipe.steps),
                    ],
                  ),
                ),
              ],
            ),
        };
      },
    );
  }
}
