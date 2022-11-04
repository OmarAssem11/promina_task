import 'package:json_annotation/json_annotation.dart';

part 'response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ResponseModel<Data> {
  final String status;
  final String message;
  final Data data;

  const ResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ResponseModel.fromJson(
    Map<String, dynamic> json,
    Data Function(Object? object) fromJsonData,
  ) =>
      _$ResponseModelFromJson(json, fromJsonData);
}
