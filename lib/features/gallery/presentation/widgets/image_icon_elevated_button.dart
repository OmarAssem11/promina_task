import 'package:flutter/material.dart';
import 'package:promina_task/core/presentation/resources/font_manager.dart';

class ImageIconElevatedButton extends StatelessWidget {
  const ImageIconElevatedButton({
    required this.label,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  });

  final String label;
  final String imagePath;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        fixedSize: Size(screenSize.width * 0.5, screenSize.height * 0.08),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Image.asset(imagePath),
          const Spacer(),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontSize: FontSizeManager.s27),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
