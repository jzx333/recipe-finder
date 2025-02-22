import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_finder_demo/features/main/presentation/widgets/main_body_desktop.dart';
import 'package:recipe_finder_demo/features/main/presentation/widgets/main_body_mobile.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
      return const MainBodyDesktop();
    }
    return const MainBodyMobile();
  }
}
