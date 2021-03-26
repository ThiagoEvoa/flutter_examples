// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_pokemon.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiPokemon implements ApiPokemon {
  _ApiPokemon(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<Pokedex> retrieveAllPokemons({offset, limit}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'offset': offset,
      r'limit': limit
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>('v2/pokemon',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Pokedex.fromJson(_result.data);
    return value;
  }

  @override
  Future<Pokemon> retrievePokemon({pokemonName}) async {
    ArgumentError.checkNotNull(pokemonName, 'pokemonName');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        'v2/pokemon/$pokemonName',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Pokemon.fromJson(_result.data);
    return value;
  }
}
