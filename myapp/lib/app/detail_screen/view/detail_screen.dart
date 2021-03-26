import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:myapp/app/detail_screen/widget/status_widget.dart';
import 'package:myapp/core/extension/string_extension.dart';
import 'package:myapp/core/util/color_util.dart';
import 'package:myapp/core/util/provider.dart';
import 'package:myapp/core/viewModel/pokemon_viewmodel.dart';
import 'package:myapp/core/widget/custom_error_widget.dart';
import 'package:myapp/core/widget/loading_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailScreen extends StatefulWidget {
  final String pokemonName;

  const DetailScreen({Key key, this.pokemonName}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String pokemonName;
  PokemonViewModel _pokemonViewModel;

  _load() {
    _pokemonViewModel.selectPokemon(pokemonName: pokemonName);
  }

  @override
  void initState() {
    _pokemonViewModel = context.read(pokemonViewModel);
    pokemonName = widget.pokemonName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          pokemonName.toUpperCaseFirstLetter(),
        ),
      ),
      body: Consumer(
        builder: (context, watch, widget) {
          final pokemon = watch(pokemonFutureProvider);

          return pokemon.when(
            data: (data) => SizedBox.fromSize(
              size: MediaQuery.of(context).size,
              child: SingleChildScrollView(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  direction: Axis.vertical,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      color: Theme.of(context).primaryColor,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).secondaryHeaderColor,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).secondaryHeaderColor,
                            width: 2,
                          ),
                        ),
                        child: Image.network(
                          data.sprites.image,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      color: Theme.of(context).primaryColor,
                      child: SizedBox.fromSize(
                        size: MediaQuery.of(context).size,
                        child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: data.types
                                .map(
                                  (item) => SvgPicture.asset(
                                    'assets/image/${item.type.name}.svg',
                                    height: 30,
                                    width: 30,
                                    color: ColorUtil.colors[item.type.name],
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    ),
                    StatusWidget(
                      statusDescription:
                          '${AppLocalizations.of(context).baseExperience}',
                      statusValue: '${data.baseExperience} exp',
                    ),
                    StatusWidget(
                      statusDescription:
                          '${AppLocalizations.of(context).height}',
                      statusValue: '${data.height * 10} cm',
                    ),
                    StatusWidget(
                      statusDescription:
                          '${AppLocalizations.of(context).weight}',
                      statusValue: '${data.weight / 10} kg',
                    ),
                  ],
                ),
              ),
            ),
            loading: () => Center(child: LoadingWidget()),
            error: (error, stacktrace) => Center(
              child: CustomErrorWidget(onPressed: _load),
            ),
          );
        },
      ),
    );
  }
}
