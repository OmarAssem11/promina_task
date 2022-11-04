import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:promina_task/core/data/exceptions/return_app_exception.dart';
import 'package:promina_task/features/gallery/data/datasources/remote_datasource/gallery_remote_datasource.dart';
import 'package:promina_task/features/gallery/data/models/images_model/gallery_model.dart';
import 'package:promina_task/features/gallery/data/models/response_model/response_model.dart';
import 'package:promina_task/features/gallery/data/services/gallery_api_service.dart';

@LazySingleton(as: GalleryRemoteDataSource)
class GalleryRemoteDataSourceImpl implements GalleryRemoteDataSource {
  final GalleryAPIService _galleryAPIService;

  const GalleryRemoteDataSourceImpl(this._galleryAPIService);

  @override
  Future<ResponseModel<GalleryModel>> getGallery() async {
    try {
      return await _galleryAPIService.getGallery();
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }

  @override
  Future<ResponseModel> uploadImage(File imageFile) async {
    try {
      return await _galleryAPIService.uploadImage(imageFile);
    } catch (exception) {
      throw returnRemoteAppException(exception);
    }
  }
}
