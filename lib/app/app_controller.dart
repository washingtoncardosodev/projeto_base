import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_base/app/core/features/theme/app_theme_dark.dart';
import 'package:projeto_base/app/core/features/theme/app_theme_factory.dart';
import 'package:projeto_base/app/core/features/theme/app_theme_light.dart';
import 'package:projeto_base/app/core/interfaces/shared_repository_interface.dart';
import 'package:projeto_base/app/core/interfaces/theme_app_interface.dart';
import 'package:projeto_base/app/core/repositories/shared_repository.dart';
part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {

  SharedRepository sharedRepository = Modular.get<ISharedRepositoryInterface>();

  _AppControllerBase() {
    loadThemeData();
  }

  @observable
  IThemeAppInterface themeApp = AppThemeFactory.getTheme(ThemeMode.light);

  @action
  loadThemeData() async {
    await sharedRepository.readThemeMode().then((themeMode) {
      themeApp = AppThemeFactory.getTheme(themeMode);
      setThemeData(themeMode, saveShared: false);
    });
  }

  @action
  setThemeData(ThemeMode themeMode, {bool saveShared = true}) async {
    themeApp = AppThemeFactory.getTheme(themeMode);
    if (saveShared) {
      await sharedRepository.saveThemeMode(themeMode);
    }
  }
  
}