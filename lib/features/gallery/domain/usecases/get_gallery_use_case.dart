import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:promina_task/core/domain/failure/failure.dart';
import 'package:promina_task/core/domain/params/no_params.dart';
import 'package:promina_task/core/domain/usecases/usecase.dart';
import 'package:promina_task/features/gallery/domain/entities/gallery.dart';
import 'package:promina_task/features/gallery/domain/repository/gallery_repository.dart';

@lazySingleton
class GetGalleryUseCase implements UseCase<Gallery, NoParams> {
  final GalleryRepository _galleryRepository;

  const GetGalleryUseCase(this._galleryRepository);

  @override
  Future<Either<Failure, Gallery>> call(NoParams noParams) =>
      _galleryRepository.getGallery();
}
