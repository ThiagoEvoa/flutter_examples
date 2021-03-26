import 'package:flutter/material.dart';
import 'package:myapp/core/util/provider.dart';
import 'package:myapp/core/viewModel/theme_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  ThemeViewModel _themeViewModel;

  @override
  void initState() {
    _themeViewModel = context.read(themeViewModel);
    super.initState();
  }

  _changeTheme(bool value) {
    _themeViewModel.changeTheme(isDarkTheme: value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${AppLocalizations.of(context).settings}'),
      ),
      body: Consumer(builder: (context, watch, widget) {
        bool isDarkTheme = watch(themeViewModel.state);

        return ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          children: [
            Wrap(
              direction: Axis.horizontal,
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Text(
                  '${AppLocalizations.of(context).darkTheme}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Switch(
                  onChanged: _changeTheme,
                  value: isDarkTheme,
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
