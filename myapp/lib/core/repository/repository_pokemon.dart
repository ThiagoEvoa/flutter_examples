import 'package:flutter/foundation.dart';
import 'package:myapp/core/model/pokedex.dart';
import 'package:myapp/core/model/pokemon.dart';

abstract class RepositoryPokemon {
  Future<Pokedex> retrieveAllPokemons({String offset, String limit});

  Future<Pokemon> retrievePokemon({@required String pokemonName});
}
