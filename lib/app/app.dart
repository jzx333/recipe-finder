import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/app/custom_scroll_behavior.dart';
import 'package:recipe_finder_demo/core/themes/themes.dart';
import 'package:recipe_finder_demo/features/main/presentation/screens/main_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: createLightTheme(),
      scrollBehavior: CustomScrollBehavior(),
      home: const MainScreen(),
    );
  }
}