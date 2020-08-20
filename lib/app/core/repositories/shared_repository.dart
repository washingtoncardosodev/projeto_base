import 'package:projeto_base/app/core/interfaces/shared_repository_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedRepository implements ISharedRepositoryInterface {
  @override
  Future<dynamic> getValue<T>(String key) async {
    return await setInstance().then((sharedPreferences) {
      switch (T) {
        case double:
          return sharedPreferences.getDouble(key);
          break;
        case int:
          return sharedPreferences.getInt(key);
          break;
        case String:
          return sharedPreferences.getString(key);
          break;
        case List:
          return sharedPreferences.getStringList(key);
          break;
        case bool:
          return sharedPreferences.getBool(key);
          break;
        default:
          return sharedPreferences.getString(key);
      }
    });
  }

  @override
  Future<bool> setValue<T>(String key, dynamic value) async {
    return await setInstance().then((sharedPreferences) {
      switch (T) {
        case double:
          return sharedPreferences.setDouble(key, value);
          break;
        case int:
          return sharedPreferences.setInt(key, value);
          break;
        case String:
          return sharedPreferences.setString(key, value);
          break;
        case List:
          return sharedPreferences.setStringList(key, value);
          break;
        case bool:
          return sharedPreferences.setBool(key, value);
          break;
        default:
          return sharedPreferences.setString(key, value);
      }
    });
  }

  @override
  Future<SharedPreferences> setInstance() async {
    return await SharedPreferences.getInstance();
  }
}