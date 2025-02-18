import 'package:flutter/material.dart';

import '../../../../core/themes/themes.dart';

class MainSearchButton extends StatelessWidget {
  const MainSearchButton({super.key, required this.borderRadius});

  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 50.0,
      ),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor,
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
          child: const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 19.0, vertical: 12.0),
            child: Row(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Text(
                    'Поиск рецепта...',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.search,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}