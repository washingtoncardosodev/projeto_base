import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_base/app/core/internacionalization/app_localizatios.dart';

class AppWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(        
        primarySwatch: Colors.blue,        
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      navigatorKey: Modular.navigatorKey,
      onGenerateRoute: Modular.generateRoute,
      supportedLocales: [
        Locale("en", "US"),
        Locale("pt", "BR"),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var suportedLocale in supportedLocales) {
          if (suportedLocale.languageCode == locale.languageCode && suportedLocale.countryCode == locale.countryCode) {
            return suportedLocale;
          }
        }
        return supportedLocales.first;
      },

    );
  }
}