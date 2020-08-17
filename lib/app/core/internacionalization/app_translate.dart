import 'package:flutter/cupertino.dart';
import 'package:projeto_base/app/core/internacionalization/app_localizatios.dart';

class AppTranslate {
  final BuildContext context;

  AppTranslate(this.context);

  String text(String key) {
    return AppLocalizations.of(context).translate(key);
  }
}