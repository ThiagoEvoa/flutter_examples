import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:myapp/core/model/pokemon.dart';

part 'pokedex.freezed.dart';
part 'pokedex.g.dart';

@freezed
abstract class Pokedex with _$Pokedex {
  const factory Pokedex({
    int count,
    String next,
    String previous,
    List<Pokemon> results,
  }) = _Pokedex;

  factory Pokedex.fromJson(Map<String, dynamic> json) =>
      _$PokedexFromJson(json);

  factory Pokedex.initialState() =>
      Pokedex(count: 0, next: '', previous: '', results: []);
}
