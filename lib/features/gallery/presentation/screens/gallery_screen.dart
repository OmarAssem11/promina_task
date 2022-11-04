import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:promina_task/core/presentation/resources/color_manager.dart';
import 'package:promina_task/core/presentation/resources/routes_manager.dart';
import 'package:promina_task/core/presentation/resources/values_manager.dart';
import 'package:promina_task/core/presentation/widgets/error_indicator.dart';
import 'package:promina_task/core/presentation/widgets/loading_indicator.dart';
import 'package:promina_task/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:promina_task/features/gallery/presentation/cubit/gallery_cubit.dart';
import 'package:promina_task/features/gallery/presentation/cubit/gallery_state.dart';
import 'package:promina_task/features/gallery/presentation/widgets/custom_material_button.dart';
import 'package:promina_task/features/gallery/presentation/widgets/image_item.dart';
import 'package:promina_task/features/gallery/presentation/widgets/upload_image_popup.dart';
import 'package:promina_task/generated/l10n.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen();

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late GalleryCubit _galleryCubit;
  late AuthCubit _authCubit;
  late ImageSource _selectedImageSource;
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Insets.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 6),
              Row(
                children: [
                  const SizedBox(width: Sizes.s16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.current.welcome,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'Mina',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  const Spacer(),
                  CachedNetworkImage(
                    imageUrl:
                        'https://img.freepik.com/free-photo/photo-attractive-bearded-young-man-with-cherful-expression-makes-okay-gesture-with-both-hands-likes-something-dressed-red-casual-t-shirt-poses-against-white-wall-gestures-indoor_273609-16239.jpg?w=1380&t=st=1667578574~exp=1667579174~hmac=3d02b6b65da6344797f098a311d27e88ee1402e0242653097298c849b2ad6dab',
                    imageBuilder: (_, imageProvider) => CircleAvatar(
                      radius: Sizes.s32,
                      backgroundImage: imageProvider,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomMaterialButton(
                    label: S.current.logout,
                    color: ColorManager.error,
                    iconData: Icons.arrow_back_rounded,
                    onPressed: () {
                      _authCubit.logout();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context)
                          .pushReplacementNamed(AppRoutes.login);
                    },
                  ),
                  CustomMaterialButton(
                    label: S.current.upload,
                    color: ColorManager.orange,
                    iconData: Icons.arrow_upward_rounded,
                    onPressed: () async {
                      await showDialog(
                        context: context,
                        builder: (_) => UploadImageDialog(
                          onSourceSelected: (selectedImageSource) {
                            _selectedImageSource = selectedImageSource;
                            Navigator.pop(context);
                          },
                        ),
                        barrierDismissible: false,
                        barrierColor: Colors.transparent,
                      );
                      _pickedImageFile = await _getImage(_selectedImageSource);
                      if (_pickedImageFile != null) {
                        _galleryCubit
                            .uploadImage(_pickedImageFile!)
                            .then((_) => _galleryCubit.getGallery());
                      }
                    },
                  ),
                ],
              ),
              const Spacer(),
              Expanded(
                flex: 89,
                child: BlocBuilder<GalleryCubit, GalleryState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loading: () => const LoadingIndicator(),
                      error: () => const ErrorIndicator(),
                      getGallerySuccess: (gallery) => GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: Sizes.s12,
                          mainAxisSpacing: Sizes.s12,
                        ),
                        itemBuilder: (_, index) => ImageItem(
                          gallery.imagesUrls.reversed.toList()[index],
                        ),
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
