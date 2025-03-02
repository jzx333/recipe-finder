import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/domain/entities/recipe_preview_entity.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/recipe_list.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/scroll_sheet_fab.dart';

/// Use in stack widget!
class BottomSheetList extends StatefulWidget {
  const BottomSheetList({
    super.key,
    required this.topPadding,
    required this.recipes,
    required this.onRecipePressed,
    required this.onRefresh,
  });

  final double topPadding;
  final List<RecipePreviewEntity> recipes;
  final Function(RecipePreviewEntity) onRecipePressed;
  final RefreshCallback onRefresh;

  @override
  State<BottomSheetList> createState() => _BottomSheetListState();
}

class _BottomSheetListState extends State<BottomSheetList> {
  double _borderRadius = 28;
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
    final height = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        DraggableScrollableSheet(
          controller: _sheetController,
          initialChildSize: (height - widget.topPadding) / height,
          minChildSize: (height - widget.topPadding) / height,
          maxChildSize: 1.0,
          builder: (BuildContext context, ScrollController scrollController) {
            _scrollController = scrollController;
            return NotificationListener<ScrollNotification>(
              onNotification: _onScrollNotification,
              child: RecipeList(
                borderRadius: _borderRadius,
                scrollController: scrollController,
                recipes: widget.recipes,
                onRecipePressed: widget.onRecipePressed,
                onRefresh: widget.onRefresh,
              ),
            );
          },
        ),
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
                    onPressed: () async {
                      await _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeIn,
                      );
                      await _sheetController.animateTo(
                        (height - widget.topPadding) / height,
                        duration: const Duration(milliseconds: 150),
                        curve: Curves.easeOut,
                      );
                    },
                  )
                : const SizedBox.shrink(),
          ),
        )
      ],
    );
  }
}
