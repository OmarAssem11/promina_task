import 'package:flutter/material.dart';
import 'package:promina_task/core/presentation/resources/color_manager.dart';
import 'package:promina_task/core/presentation/resources/values_manager.dart';

class CustomMaterialButton extends StatelessWidget {
  const CustomMaterialButton({
    required this.label,
    required this.color,
    required this.iconData,
    required this.onPressed,
  });

  final String label;
  final Color color;
  final IconData iconData;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: ColorManager.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: Insets.m,
        vertical: Insets.xs,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.s12)),
      ),
      onPressed: onPressed,
      child: Row(
        children: [
          Container(
            height: Sizes.s30,
            width: Sizes.s36,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(Sizes.s12)),
            ),
            child: Icon(
              iconData,
              color: ColorManager.white,
            ),
          ),
          const SizedBox(width: Sizes.s16),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
