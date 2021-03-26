import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/core/api/api_pokemon.dart';
import 'package:myapp/core/model/pokemon.dart';
import 'package:myapp/core/repository/repository_pokemon_impl.dart';
import 'package:myapp/core/viewModel/pokedex_viewmodel.dart';
import 'package:myapp/core/viewModel/pokemon_viewmodel.dart';
import 'package:myapp/core/viewModel/theme_viewmodel.dart';

//API
final Provider<Dio> dioProvider = Provider((ref) {
  final Dio dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/'));
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options) async => options,
    onResponse: (response) async => response,
    onError: (error) async => error,
  ));
  return dio;
});

final apiPokemon = Provider((ref) => ApiPokemon(ref.watch(dioProvider)));

//Repository
final repositoryPokemon = Provider(
  (ref) => RepositoryPokemonImpl(
    ref.watch(apiPokemon),
  ),
);

//ViewModel
final themeViewModel = StateNotifierProvider(
  (ref) => ThemeViewModel(),
);

final pokemonViewModel = StateNotifierProvider(
  (ref) => PokemonViewModel(ref.watch(repositoryPokemon)),
);

final pokedexViewModel = StateNotifierProvider(
  (ref) => PokedexViewModel(ref.watch(repositoryPokemon)),
);

final pokemonFutureProvider = FutureProvider<Pokemon>(
  (ref) {
    ref.watch(pokemonViewModel.state);
    return ref.watch(pokemonViewModel).retrievePokemon();
  },
);
