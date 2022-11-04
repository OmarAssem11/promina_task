import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina_task/core/presentation/resources/color_manager.dart';
import 'package:promina_task/core/presentation/resources/values_manager.dart';
import 'package:promina_task/features/gallery/presentation/widgets/image_icon_elevated_button.dart';
import 'package:promina_task/generated/assets.gen.dart';
import 'package:promina_task/generated/l10n.dart';

class UploadImageDialog extends StatelessWidget {
  const UploadImageDialog({required this.onSourceSelected});

  final void Function(ImageSource) onSourceSelected;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        Center(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Container(
                height: screenSize.height * 0.3,
                width: screenSize.width * 0.75,
                padding: const EdgeInsets.symmetric(horizontal: Insets.xl),
                decoration: const BoxDecoration(
                  color: ColorManager.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Sizes.s32),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ImageIconElevatedButton(
                      label: S.current.gallery,
                      imagePath: Assets.images.gallery.path,
                      color: ColorManager.lightPurple,
                      onPressed: () => onSourceSelected(ImageSource.gallery),
                    ),
                    ImageIconElevatedButton(
                      label: S.current.camera,
                      imagePath: Assets.images.camera.path,
                      color: ColorManager.lightBlue,
                      onPressed: () => onSourceSelected(ImageSource.camera),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
