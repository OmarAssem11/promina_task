import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:promina_task/core/domain/failure/failure.dart';
import 'package:promina_task/core/domain/params/app_params.dart';
import 'package:promina_task/core/domain/usecases/usecase.dart';
import 'package:promina_task/features/gallery/domain/repository/gallery_repository.dart';

@lazySingleton
class UploadImageUseCase implements UseCase<Unit, UploadImageParams> {
  final GalleryRepository _galleryRepository;

  const UploadImageUseCase(this._galleryRepository);

  @override
  Future<Either<Failure, Unit>> call(UploadImageParams uploadImageData) =>
      _galleryRepository.uploadImage(uploadImageData.imageFile);
}

class UploadImageParams extends AppParams {
  final File imageFile;

  UploadImageParams(this.imageFile);

  @override
  List<Object?> get props => [imageFile];
}
