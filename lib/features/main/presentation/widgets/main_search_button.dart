import 'package:flutter/material.dart';

class MainSearchButton extends StatelessWidget {
  const MainSearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const double borderRadius = 16;
    return Container(
      margin: const EdgeInsets.only(
        top: 50.0,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SearchScreen()),
            //);
            print("POISK");
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 19.0, vertical: 12.0),
            child: Row(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    'Поиск рецепта...',
                    style: theme.textTheme.labelMedium,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.search,
                  color: theme.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
