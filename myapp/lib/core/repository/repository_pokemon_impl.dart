import 'package:myapp/core/api/api_pokemon.dart';
import 'package:myapp/core/model/pokedex.dart';
import 'package:myapp/core/model/pokemon.dart';
import 'package:myapp/core/repository/repository_pokemon.dart';

class RepositoryPokemonImpl extends RepositoryPokemon {
  RepositoryPokemonImpl(this._apiPokemon);

  final ApiPokemon _apiPokemon;

  @override
  Future<Pokedex> retrieveAllPokemons({String offset, String limit}) async {
    return await _apiPokemon.retrieveAllPokemons(offset: offset, limit: limit);
  }

  @override
  Future<Pokemon> retrievePokemon({String pokemonName}) async {
    return await _apiPokemon.retrievePokemon(pokemonName: pokemonName);
  }
}
