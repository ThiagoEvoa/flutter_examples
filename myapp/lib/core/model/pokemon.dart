import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/core/model/pokemon_type.dart';
import 'package:myapp/core/model/sprite.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

@freezed
abstract class Pokemon with _$Pokemon {
  const factory Pokemon({
    int id,
    String name,
    String url,
    @JsonKey(name: 'base_experience') int baseExperience,
    int height,
    int weight,
    Sprite sprites,
    List<PokemonType> types,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);

  factory Pokemon.initialState() => Pokemon(
      id: -1,
      name: '',
      url: '',
      baseExperience: 0,
      height: 0,
      weight: 0,
      sprites: Sprite.initialState(),
      types: [PokemonType.initialState()]);
}
