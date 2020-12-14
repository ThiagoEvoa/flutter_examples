import 'package:json_annotation/json_annotation.dart';

part 'person_dto.g.dart';

@JsonSerializable()
class PersonDTO {
  @JsonKey(name: '_id')
  String id;
  String name;

  PersonDTO({this.id, this.name});

  factory PersonDTO.fromJson(Map<String, dynamic> json) =>
      _$PersonDTOFromJson(json);

  Map<String, dynamic> toJson() => _$PersonDTOToJson(this);
}
