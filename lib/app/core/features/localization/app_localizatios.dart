import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'app_localization_delegate.dart';

class AppLocalizations {
  final Locale locale;
  Map<String, dynamic> _localizationsStrings;

  AppLocalizations(this.locale);

  Future<bool> load() async {
    var jsonString =
        await rootBundle.loadString("lang/${locale.languageCode}.json");
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizationsStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    return _localizationsStrings[key];
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();
}
