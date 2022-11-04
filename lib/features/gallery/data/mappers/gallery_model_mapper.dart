import 'package:promina_task/features/gallery/data/models/images_model/gallery_model.dart';
import 'package:promina_task/features/gallery/domain/entities/gallery.dart';

extension GalleryModelMapper on GalleryModel {
  Gallery get fromModel => Gallery(
        imagesUrls,
      );
}
