import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/bottom_sheet_list.dart';
import 'package:recipe_finder_demo/features/details/presentation/screens/details_screen.dart';
import 'package:recipe_finder_demo/features/main/presentation/notifier/main_notifier.dart';
import 'package:recipe_finder_demo/features/main/presentation/notifier/main_state.dart';
import 'package:recipe_finder_demo/features/main/presentation/widgets/top_info.dart';

class MainBodyMobile extends StatelessWidget {
  const MainBodyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final mainNotifier = context.read<MainNotifier>();
    return Consumer<MainNotifier>(
      builder: (context, state, child) {
        return switch (state.state) {
          MainStateLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          MainStateError s => Center(
              child: Text("Error ${s.err}"),
            ),
          MainStateLoaded s => Stack(
              children: [
                const Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: TopInfo(),
                ),
                BottomSheetList(
                  onRefresh: mainNotifier.refresh,
                  topPadding: TopInfo.height,
                  recipes: s.recipes,
                  onRecipePressed: (recipe) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailsScreen(recipePreview: recipe);
                        },
                      ),
                    );
                  },
                )
              ],
            ),
        };
      },
    );
  }
}
