import 'dart:io';

import 'package:promina_task/features/gallery/data/models/images_model/gallery_model.dart';
import 'package:promina_task/features/gallery/data/models/response_model/response_model.dart';

abstract class GalleryRemoteDataSource {
  Future<ResponseModel<GalleryModel>> getGallery();

  Future<ResponseModel> uploadImage(File imageFile);
}
