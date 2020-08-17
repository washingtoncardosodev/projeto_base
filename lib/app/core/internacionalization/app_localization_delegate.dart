import 'package:flutter/cupertino.dart';
import 'package:projeto_base/app/core/internacionalization/app_localizatios.dart';

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {

  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {  
    return ["pt", "en"].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {  
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;

}