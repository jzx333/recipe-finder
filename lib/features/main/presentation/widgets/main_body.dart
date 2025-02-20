import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/recipe_list.dart';
import 'package:recipe_finder_demo/core/presentation/widgets/scroll_sheet_fab.dart';
import 'package:recipe_finder_demo/features/main/presentation/widgets/top_info.dart';

class MainBody extends StatefulWidget {
  const MainBody({super.key});

  @override
  State<MainBody> createState() => _MainBodyState();
}

class _MainBodyState extends State<MainBody> {
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
        const Positioned(
          left: 0,
          right: 0,
          top: 0,
          child: TopInfo(),
        ),
        DraggableScrollableSheet(
          controller: _sheetController,
          initialChildSize: (height - TopInfo.height) / height,
          minChildSize: (height - TopInfo.height) / height,
          maxChildSize: 1.0,
          builder: (BuildContext context, ScrollController scrollController) {
            _scrollController = scrollController;
            return NotificationListener<ScrollNotification>(
              onNotification: _onScrollNotification,
              child: RecipeList(
                borderRadius: _borderRadius,
                scrollController: scrollController,
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
                        (height - TopInfo.height) / height,
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
