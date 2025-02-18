import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/recipe_list.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/scroll_sheet_fab.dart';
import 'package:recipe_finder_demo/core/themes/themes.dart';

import '../widgets/top_info.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  double _borderRadius = 20.0;
  var _isScrollStart = true;
  late ScrollController _scrollController;
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  bool _onScrollNotification(ScrollNotification notification) {
    // Если скролл изменился, обновляем радиус
    if (notification is ScrollUpdateNotification) {
      setState(() {
        // Устанавливаем радиус меньше при прокрутке вниз
        _borderRadius = (20 - _scrollController.offset).clamp(0, 20);

        _isScrollStart = _scrollController.offset < 100;
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const topHeight = 300.0;
    final height = MediaQuery.sizeOf(context).height;

    return Container(
      color: AppColors.primaryColor,
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: TopInfo(),
          ),
          DraggableScrollableSheet(
              controller: _sheetController,
              initialChildSize: (height - topHeight) / height,
              minChildSize: (height - topHeight) / height,
              maxChildSize: 1.0,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                _scrollController = scrollController;
                return NotificationListener<ScrollNotification>(
                  onNotification: _onScrollNotification,
                  child: RecipeList(
                    borderRadius: _borderRadius,
                    scrollController: scrollController,
                  ),
                );
              }),
          Positioned(
            right: 20,
            bottom: 20,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: !_isScrollStart
                  ? ScrollSheetFab(
                      scrollController: _scrollController,
                      sheetController: _sheetController,
                      height: height,
                      topHeight: topHeight,
                    )
                  : const SizedBox.shrink(),
            ),
          )
        ],
      ),
    );
  }
}
