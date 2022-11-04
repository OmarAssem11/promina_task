import 'package:freezed_annotation/freezed_annotation.dart';

part 'gallery.freezed.dart';

@freezed
class Gallery with _$Gallery {
  const factory Gallery(
    List<String> imagesUrls,
  ) = _Gallery;
}
