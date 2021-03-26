// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Pokemon _$_$_PokemonFromJson(Map<String, dynamic> json) {
  return _$_Pokemon(
    id: json['id'] as int,
    name: json['name'] as String,
    url: json['url'] as String,
    baseExperience: json['base_experience'] as int,
    height: json['height'] as int,
    weight: json['weight'] as int,
    sprites: json['sprites'] == null
        ? null
        : Sprite.fromJson(json['sprites'] as Map<String, dynamic>),
    types: (json['types'] as List)
        ?.map((e) =>
            e == null ? null : PokemonType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_PokemonToJson(_$_Pokemon instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'url': instance.url,
      'base_experience': instance.baseExperience,
      'height': instance.height,
      'weight': instance.weight,
      'sprites': instance.sprites,
      'types': instance.types,
    };
