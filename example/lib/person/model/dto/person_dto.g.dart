// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonDTO _$PersonDTOFromJson(Map<String, dynamic> json) {
  return PersonDTO(
    id: json['_id'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$PersonDTOToJson(PersonDTO instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
    };
