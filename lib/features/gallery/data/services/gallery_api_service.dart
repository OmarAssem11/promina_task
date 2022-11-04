import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:promina_task/core/data/constants/api_constants.dart';
import 'package:promina_task/features/gallery/data/models/images_model/gallery_model.dart';
import 'package:promina_task/features/gallery/data/models/response_model/response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'gallery_api_service.g.dart';

@lazySingleton
@RestApi()
abstract class GalleryAPIService {
  @factoryMethod
  factory GalleryAPIService(Dio dio) = _GalleryAPIService;

  @GET(APIConstants.getGalleyEndpoint)
  Future<ResponseModel<GalleryModel>> getGallery();

  @POST(APIConstants.uploadImageEndpoint)
  Future<ResponseModel> uploadImage(
    @Body() File imageFile,
  );
}
