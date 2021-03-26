import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/model/pokedex.dart';
import 'package:myapp/core/model/pokemon.dart';
import 'package:myapp/core/model/state_enum.dart';
import 'package:myapp/core/repository/repository_pokemon.dart';
import 'package:myapp/core/extension/string_extension.dart';

class PokedexViewModel extends StateNotifier<StateEnum> {
  PokedexViewModel(this._repositoryPokemon) : super(StateEnum.LOADING);

  final RepositoryPokemon _repositoryPokemon;
  Pokedex pokedex = Pokedex.initialState();
  List<Pokemon> pokemons = [];

  void retry() {
    state = StateEnum.LOADING;
  }

  void retrieveAllPokemons({String nextUrl}) async {
    try {
      String offset;
      String limit;
      if (nextUrl != null) {
        offset = nextUrl.getRange();
        limit = '20';
      }

      Pokedex resultPokedex = await _repositoryPokemon.retrieveAllPokemons(
        offset: offset,
        limit: limit,
      );
      pokemons.addAll(resultPokedex.results);

      if (pokedex.count == 0) {
        pokedex = resultPokedex;
      } else {
        pokedex = pokedex.copyWith(
          next: resultPokedex.next,
          previous: resultPokedex.previous,
          results: pokemons,
        );
      }
      state = StateEnum.DONE;
    } catch (ex) {
      state = StateEnum.ERROR;
    }
  }
}
