import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:promina_task/core/domain/failure/failure.dart';
import 'package:promina_task/features/gallery/domain/entities/gallery.dart';

abstract class GalleryRepository {
  Future<Either<Failure, Gallery>> getGallery();

  Future<Either<Failure, Unit>> uploadImage(File imageFile);
}
