import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:promina_task/core/domain/params/no_params.dart';
import 'package:promina_task/features/gallery/domain/usecases/get_gallery_use_case.dart';
import 'package:promina_task/features/gallery/domain/usecases/upload_image_use_case.dart';
import 'package:promina_task/features/gallery/presentation/cubit/gallery_state.dart';

@injectable
class GalleryCubit extends Cubit<GalleryState> {
  GalleryCubit(
    this._getGalleryUseCase,
    this._uploadImageUseCase,
  ) : super(const GalleryInitial());

  final GetGalleryUseCase _getGalleryUseCase;
  final UploadImageUseCase _uploadImageUseCase;

  Future<void> getGallery() async {
    emit(const GalleryLoading());
    final result = await _getGalleryUseCase(const NoParams());
    emit(
      result.fold(
        (failure) => const GalleryError(),
        (gallery) => GetGallerySuccess(gallery),
      ),
    );
  }

  Future<void> uploadImage(File imageFile) async {
    emit(const GalleryLoading());
    final result = await _uploadImageUseCase(UploadImageParams(imageFile));
    emit(
      result.fold(
        (failure) => const GalleryError(),
        (_) => const UploadImageSuccess(),
      ),
    );
  }
}
