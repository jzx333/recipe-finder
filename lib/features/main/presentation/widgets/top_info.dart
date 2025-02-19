import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/features/main/presentation/widgets/main_search_button.dart';

class TopInfo extends StatelessWidget {
  const TopInfo({super.key});

  static const height = 170.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          MainSearchButton(),
          const SizedBox(height: 8.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text("Завтрак"),
                Text("Обед"),
                Text("Ужин"),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer,
              borderRadius: const BorderRadius.all(
                Radius.circular(25.0),
              ),
            ),
            child: Text("Tags"),
          ),
        ],
      ),
    );
  }
}
