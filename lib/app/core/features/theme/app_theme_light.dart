import 'package:flutter/src/material/theme_data.dart';
import 'package:projeto_base/app/core/interfaces/theme_app_interface.dart';

class AppThemeLight implements IThemeAppInterface {
  @override
  ThemeData getTheme() {
    return ThemeData.light();
  }

}