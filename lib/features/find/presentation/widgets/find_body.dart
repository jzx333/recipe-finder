import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/bottom_sheet_list.dart';
import 'package:recipe_finder_demo/features/details/presentation/screens/details_screen.dart';
import 'package:recipe_finder_demo/features/find/presentation/notifier/find_notifier.dart';
import 'package:recipe_finder_demo/features/find/presentation/notifier/find_state.dart';
import 'package:recipe_finder_demo/features/find/presentation/widgets/find_text_field.dart';

class FindBody extends StatelessWidget {
  const FindBody({super.key, required this.openDrawer});

  final VoidCallback openDrawer;

  @override
  Widget build(BuildContext context) {
    return Consumer<FindNotifier>(
      builder: (context, findNotifier, child) {
        return switch (findNotifier.state) {
          FindStateLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          FindStateError s => Center(
              child: Text("Error ${s.err}"),
            ),
          FindStateLoaded s => Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  child: FindTextField(
                    onSettingsPressed: openDrawer,
                  ),
                ),
                BottomSheetList(
                  onRefresh: () async {},
                  topPadding: FindTextField.height,
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
