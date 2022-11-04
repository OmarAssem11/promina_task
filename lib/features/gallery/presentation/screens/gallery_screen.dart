import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina_task/core/presentation/resources/color_manager.dart';
import 'package:promina_task/core/presentation/widgets/error_indicator.dart';
import 'package:promina_task/core/presentation/widgets/loading_indicator.dart';
import 'package:promina_task/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:promina_task/features/gallery/presentation/cubit/gallery_cubit.dart';
import 'package:promina_task/features/gallery/presentation/cubit/gallery_state.dart';
import 'package:promina_task/features/gallery/presentation/widgets/custom_material_button.dart';
import 'package:promina_task/features/gallery/presentation/widgets/image_item.dart';
import 'package:promina_task/generated/l10n.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen();

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late GalleryCubit _galleryCubit;
  late AuthCubit _authCubit;
  File? _pickedImageFile;

  @override
  void initState() {
    super.initState();
    _galleryCubit = BlocProvider.of<GalleryCubit>(context);
    _authCubit = BlocProvider.of<AuthCubit>(context);
    _galleryCubit.getGallery();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorManager.primary,
              ColorManager.lightPink,
              ColorManager.white,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.current.welcome,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomMaterialButton(
                  label: S.current.logout,
                  color: ColorManager.error,
                  iconData: Icons.arrow_back_rounded,
                  onPressed: () => _authCubit.logout(),
                ),
                CustomMaterialButton(
                  label: S.current.upload,
                  color: ColorManager.orange,
                  iconData: Icons.arrow_upward_rounded,
                  onPressed: () async {
                    _pickedImageFile = await _getImage(ImageSource.gallery);
                    if (_pickedImageFile != null) {
                      _galleryCubit.uploadImage(_pickedImageFile!);
                    }
                  },
                ),
              ],
            ),
            Expanded(
              child: BlocBuilder<GalleryCubit, GalleryState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loading: () => const LoadingIndicator(),
                    error: () => const ErrorIndicator(),
                    getGallerySuccess: (gallery) => GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (context, index) =>
                          ImageItem(gallery.imagesUrls[index]),
                      itemCount: gallery.imagesUrls.length,
                    ),
                    orElse: () => const SizedBox.expand(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<File?> _getImage(ImageSource imageSource) async {
  final pickedFile = await ImagePicker().pickImage(source: imageSource);
  if (pickedFile != null) {
    return File(pickedFile.path);
  }
  return null;
}
