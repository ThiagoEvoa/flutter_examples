import 'package:json_annotation/json_annotation.dart';

part 'resource_error.g.dart';

@JsonSerializable()
class ResourceError {
  final String type;
  final String message;

  ResourceError(this.type, this.message);

  factory ResourceError.fromJson(Map<String, dynamic> json) =>
      _$ResourceErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceErrorToJson(this);
}