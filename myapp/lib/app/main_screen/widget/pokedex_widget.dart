import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/app/detail_screen/view/detail_screen.dart';
import 'package:myapp/core/model/pokedex.dart';
import 'package:myapp/core/model/state_enum.dart';
import 'package:myapp/core/util/navigation_util.dart';
import 'package:myapp/core/util/provider.dart';
import 'package:myapp/core/viewModel/pokedex_viewmodel.dart';
import 'package:myapp/core/viewModel/pokemon_viewmodel.dart';
import 'package:myapp/core/widget/custom_error_widget.dart';
import 'package:myapp/core/widget/loading_widget.dart';
import 'package:myapp/core/extension/string_extension.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PokedexWidget extends StatefulWidget {
  @override
  _PokedexWidgetState createState() => _PokedexWidgetState();
}

class _PokedexWidgetState extends State<PokedexWidget> {
  PokedexViewModel _pokedexViewModel;
  PokemonViewModel _pokemonViewModel;

  void _openDetailScreen({@required String pokemonName}) {
    _pokemonViewModel.selectPokemon(pokemonName: pokemonName);
    push(context: context, screen: DetailScreen(pokemonName: pokemonName));
  }

  void _load({String nextUrl}) {
    _pokedexViewModel.retrieveAllPokemons(nextUrl: nextUrl);
  }

  @override
  void initState() {
    _pokemonViewModel = context.read(pokemonViewModel);
    _pokedexViewModel = context.read(pokedexViewModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, widget) {
        StateEnum state = watch(pokedexViewModel.state);

        switch (state) {
          case StateEnum.LOADING:
            _load();
            return Center(child: LoadingWidget());
          case StateEnum.ERROR:
            return CustomErrorWidget(onPressed: _load);
          default:
            {
              Pokedex pokedex = _pokedexViewModel.pokedex;

              return ListView.builder(
                itemCount: pokedex.results.length + 1,
                itemBuilder: (context, index) {
                  if (index < pokedex.results.length) {
                    final String pokemonName = pokedex.results[index].name;

                    return Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).textTheme.bodyText1.color,
                            width: 0.1,
                          ),
                        ),
                      ),
                      child: ListTile(
                        onTap: () =>
                            _openDetailScreen(pokemonName: pokemonName),
                        title: Text(
                          pokemonName.toUpperCaseFirstLetter(),
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    );
                  } else if (pokedex.next != null) {
                    _load(nextUrl: pokedex.next);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 32),
                      child: Center(
                        child: LoadingWidget(),
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: Center(
                        child: Text(
                          '${AppLocalizations.of(context).noMoreLoad}',
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                      ),
                    );
                  }
                },
              );
            }
        }
      },
    );
  }
}
