import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:promina_task/features/gallery/domain/entities/gallery.dart';

part 'gallery_state.freezed.dart';

@freezed
class GalleryState with _$GalleryState {
  const factory GalleryState.initial() = GalleryInitial;
  const factory GalleryState.loading() = GalleryLoading;
  const factory GalleryState.error() = GalleryError;
  const factory GalleryState.getGallerySuccess(Gallery gallery) =
      GetGallerySuccess;
  const factory GalleryState.uploadImageSuccess() = UploadImageSuccess;
}
