import 'package:flutter/material.dart';
import '../../app/core/local_storage/local_storage.dart';
import '../../app/interfaces/shared_repository_interface.dart';

class SharedRepository implements ISharedRepositoryInterface {

  static const String constThemeMode = 'theme_mode';
  static const String constThemeModeDark = "ThemeMode.dark";
  static const String constThemeModeLight = "ThemeMode.light";

  @override
  String readUserInfo() {
    return null;
  }

  @override
  Null saveUserInfo(String userInfo) {
    return null;
  }

  @override
  Future<ThemeMode> readThemeMode() async {
    return await LocalStorage.getValue<String>(constThemeMode).then((value) {
      switch (value) {
        case constThemeModeDark:
          return ThemeMode.dark;
          break;
        case constThemeModeLight:
          return ThemeMode.light;
          break;
        default:
          return ThemeMode.light;
          break;
      }
    });
  }

  @override
  Future<bool> saveThemeMode(ThemeMode themeMode) async {
    return await LocalStorage.setValue<String>(
        constThemeMode, themeMode.toString());
  }
  
}