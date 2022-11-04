import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:promina_task/core/presentation/resources/values_manager.dart';

class ImageItem extends StatelessWidget {
  const ImageItem(this.imageUrl);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(Sizes.s16)),
        ),
      ),
    );
  }
}
