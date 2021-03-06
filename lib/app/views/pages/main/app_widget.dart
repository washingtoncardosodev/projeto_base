import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_base/app/core/localization/app_localizatios.dart';

import '../../../controllers/app_controller.dart';


class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return MaterialApp(
        title: 'Flutter Demo',
        theme: Modular.get<AppController>().themeApp.getTheme(),
        themeMode: Modular.get<AppController>().themeMode,
        initialRoute: "/",
        navigatorKey: Modular.navigatorKey,
        onGenerateRoute: Modular.generateRoute,
        supportedLocales: [
          Locale("en", "US"),
          Locale("pt", "BR"),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var suportedLocale in supportedLocales) {
            if (suportedLocale.languageCode == locale.languageCode &&
                suportedLocale.countryCode == locale.countryCode) {
              return suportedLocale;
            }
          }
          return supportedLocales.first;
        },
      );
    });
  }
}
