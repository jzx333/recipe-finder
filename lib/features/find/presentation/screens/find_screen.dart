import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_finder_demo/features/find/presentation/notifier/find_notifier.dart';
import 'package:recipe_finder_demo/features/find/presentation/notifier/find_state.dart';
import 'package:recipe_finder_demo/features/find/presentation/widgets/find_body.dart';
import 'package:recipe_finder_demo/features/find/presentation/widgets/find_drawer.dart';

class FindScreen extends StatelessWidget {
  const FindScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => FindNotifier()..init(),
      builder: (context, child) {
        return Scaffold(
          drawer: Consumer<FindNotifier>(
            builder: (
              context,
              findNotifier,
              child,
            ) {
              final watchFindNotifier = context.watch<FindNotifier>();
              if (watchFindNotifier.state is FindStateLoaded) {
                return FindDrawer(
                  tags: (watchFindNotifier.state as FindStateLoaded).tags,
                  selectedTags: (watchFindNotifier.state as FindStateLoaded).filterTags,
                  budget: (watchFindNotifier.state as FindStateLoaded).budget,
                  calories: (watchFindNotifier.state as FindStateLoaded).calories,
                  time: (watchFindNotifier.state as FindStateLoaded).time,
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Меню поиска",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF4FCF1)),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: Colors.transparent,
            iconTheme: const IconThemeData(color: Color(0xFFF4FCF1)),
          ),
          body: Builder(builder: (context) {
            return FindBody(
              openDrawer: () {
                Scaffold.of(context).openDrawer();
              },
            );
          }),
        );
      },
    );
  }
}
