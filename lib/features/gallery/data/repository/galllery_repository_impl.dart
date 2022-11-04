import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:promina_task/core/data/exceptions/app_exception.dart';
import 'package:promina_task/core/domain/failure/failure.dart';
import 'package:promina_task/core/domain/failure/return_failure.dart';
import 'package:promina_task/features/gallery/data/datasources/remote_datasource/gallery_remote_datasource.dart';
import 'package:promina_task/features/gallery/data/mappers/gallery_model_mapper.dart';
import 'package:promina_task/features/gallery/domain/entities/gallery.dart';
import 'package:promina_task/features/gallery/domain/repository/gallery_repository.dart';

@LazySingleton(as: GalleryRepository)
class GalleryRepositoryImpl implements GalleryRepository {
  final GalleryRemoteDataSource _galleryRemoteDataSource;

  const GalleryRepositoryImpl(this._galleryRemoteDataSource);

  @override
  Future<Either<Failure, Gallery>> getGallery() async {
    try {
      final galleryResponse = await _galleryRemoteDataSource.getGallery();
      return right(galleryResponse.data.fromModel);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }

  @override
  Future<Either<Failure, Unit>> uploadImage(File imageFile) async {
    try {
      await _galleryRemoteDataSource.uploadImage(imageFile);
      return right(unit);
    } on AppException catch (appException) {
      return left(returnFailure(appException));
    }
  }
}
