import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/app/splash_screen/screen/splash_screen.dart';
import 'package:myapp/core/util/provider.dart';
import 'package:myapp/core/util/theme/theme_dark.dart';
import 'package:myapp/core/util/theme/theme_light.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, widget) {
        bool isDarkTheme = watch(themeViewModel.state);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            AppLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('en', ''),
          ],
          title: 'Flutter Demo',
          theme: isDarkTheme ? DarkTheme.theme : LightTheme.theme,
          home: SplashScreen(),
        );
      },
    );
  }
}
