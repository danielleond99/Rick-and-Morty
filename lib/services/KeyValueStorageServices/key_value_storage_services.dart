import 'package:shared_preferences/shared_preferences.dart';

class KeyValueStorageServices {
  static final KeyValueStorageServices _instance =
      KeyValueStorageServices._internal();
  late SharedPreferences _prefs;

  KeyValueStorageServices._internal();

  factory KeyValueStorageServices() {
    return _instance;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> reload() async {
    _prefs.reload();
  }

  Future<T?> getValue<T>(String key) async {
    switch (T) {
      case const (int):
        return _prefs.getInt(key) as T?;
      case const (String):
        return _prefs.getString(key) as T?;
      default:
        return _prefs.getBool(key) as T?;
    }
  }

  Future<bool> removeKey(String key) async {
    return await _prefs.remove(key);
  }

  Future<bool> clear() async {
    return await _prefs.clear();
  }

  Future<void> setKeyValue<T>(String key, value) async {
    switch (T) {
      case const (int):
        _prefs.setInt(key, value);
        break;
      case const (String):
        _prefs.setString(key, value);
        break;
      default:
        _prefs.setBool(key, value);
        break;
    }
  }
}
