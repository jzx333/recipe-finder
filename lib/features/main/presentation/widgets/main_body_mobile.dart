import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/bottom_sheet_list.dart';
import 'package:recipe_finder_demo/features/main/presentation/widgets/top_info.dart';

class MainBodyMobile extends StatelessWidget {
  const MainBodyMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: TopInfo(),
        ),
        BottomSheetList(
          topPadding: TopInfo.height,
        )
      ],
    );
  }
}
