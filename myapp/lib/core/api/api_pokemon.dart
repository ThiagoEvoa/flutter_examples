import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:myapp/core/model/pokedex.dart';
import 'package:myapp/core/model/pokemon.dart';
import 'package:retrofit/retrofit.dart';

part 'api_pokemon.g.dart';

@RestApi()
abstract class ApiPokemon {
  factory ApiPokemon(Dio dio) = _ApiPokemon;

  @GET('v2/pokemon')
  Future<Pokedex> retrieveAllPokemons({
    @Query('offset') String offset,
    @Query('limit') String limit,
  });

  @GET('v2/pokemon/{pokemonName}')
  Future<Pokemon> retrievePokemon(
      {@Path('pokemonName') @required String pokemonName});
}
