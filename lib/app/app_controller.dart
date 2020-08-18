import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_base/app/core/interfaces/theme_app_interface.dart';
import 'package:projeto_base/app/core/theme/app_theme_dark.dart';
import 'package:projeto_base/app/core/theme/app_theme_light.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {

  @observable
  IThemeAppInterface themeApp = AppThemeLight();

  @action
  setThemeData(ThemeMode themeMode) {
    switch (themeMode) {
      case ThemeMode.dark:
        themeApp = AppThemeDark();
        break;
      default: 
        themeApp = AppThemeLight();
        break;
    }
  }
  
}