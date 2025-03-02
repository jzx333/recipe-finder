import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_finder_demo/features/main/presentation/notifier/main_notifier.dart';
import 'package:recipe_finder_demo/features/main/presentation/widgets/main_body_desktop.dart';
import 'package:recipe_finder_demo/features/main/presentation/widgets/main_body_mobile.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => MainNotifier()..init(),
        child: Builder(
          builder: (context) {
            if (Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
              return const MainBodyDesktop();
            }
            return const MainBodyMobile();
          },
        ),
      ),
    );
  }
}
