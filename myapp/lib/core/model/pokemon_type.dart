import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/core/model/type.dart';

part 'pokemon_type.freezed.dart';
part 'pokemon_type.g.dart';

@freezed
abstract class PokemonType with _$PokemonType {
  const factory PokemonType({
    Type type,
  }) = _PokemonType;

  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);

  factory PokemonType.initialState() => PokemonType(type: Type());
}
