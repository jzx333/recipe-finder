import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_finder_demo/features/find/presentation/notifier/find_notifier.dart';

class FindTextField extends StatelessWidget {
  const FindTextField(
      {super.key, required this.onSettingsPressed});

  static const height = 100.0;

  final VoidCallback onSettingsPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final findNotifier = context.read<FindNotifier>();
    return SizedBox(
      height: height,
      child: Center(
        child: Container(
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                  onChanged: (value) {
                    findNotifier.setName(value.trim());
                  },
                  decoration: const InputDecoration(
                    hintText: "Поиск рецепта...",
                    hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color(0x80181818),
                        fontWeight: FontWeight.w400),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: SizedBox(
                  width: 2,
                  height: double.infinity,
                  child: ColoredBox(color: Colors.black26),
                ),
              ),
              const SizedBox(width: 4),
              IconButton(
                  onPressed: onSettingsPressed,
                  icon: Icon(
                    Icons.settings,
                    color: theme.primaryColor,
                  )),
              const SizedBox(width: 4),
            ],
          ),
        ),
      ),
    );
  }
}
