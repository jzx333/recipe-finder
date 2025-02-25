import 'package:flutter/material.dart';

class TopPhotoBar extends StatelessWidget {
  const TopPhotoBar({
    super.key,
    required this.asset,
  });

  final String asset;

  static double height = 200;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height + 30,
      child: Image.network(asset, fit: BoxFit.fitWidth),
    );
  }
}
