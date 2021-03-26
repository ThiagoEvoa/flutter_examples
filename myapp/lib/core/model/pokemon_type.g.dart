// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PokemonType _$_$_PokemonTypeFromJson(Map<String, dynamic> json) {
  return _$_PokemonType(
    type: json['type'] == null
        ? null
        : Type.fromJson(json['type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_PokemonTypeToJson(_$_PokemonType instance) =>
    <String, dynamic>{
      'type': instance.type,
    };
