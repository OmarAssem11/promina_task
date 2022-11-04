import 'package:json_annotation/json_annotation.dart';

part 'gallery_model.g.dart';

@JsonSerializable()
class GalleryModel {
  @JsonKey(name: 'images')
  final List<String> imagesUrls;

  const GalleryModel(
    this.imagesUrls,
  );

  factory GalleryModel.fromJson(Map<String, dynamic> json) =>
      _$GalleryModelFromJson(json);
}
