import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/model/pokemon.dart';
import 'package:myapp/core/repository/repository_pokemon.dart';

class PokemonViewModel extends StateNotifier<Pokemon> {
  PokemonViewModel(this._repositoryPokemon) : super(Pokemon.initialState());

  final RepositoryPokemon _repositoryPokemon;

  selectPokemon({@required String pokemonName}) {
    state = state.copyWith(name: pokemonName);
  }

  Future<Pokemon> retrievePokemon() async {
    return await _repositoryPokemon.retrievePokemon(pokemonName: state.name);
  }
}
