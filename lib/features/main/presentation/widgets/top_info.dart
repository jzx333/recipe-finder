import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/themes/themes.dart';
import 'package:recipe_finder_demo/features/main/presentation/widgets/main_search_button.dart';

const topHeight = 150.0;

class TopInfo extends StatelessWidget {
  const TopInfo({super.key});

  final double _borderRadius = 15.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        children: [
          MainSearchButton(borderRadius: _borderRadius),
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
          SizedBox(height: 8.0),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.all(
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
