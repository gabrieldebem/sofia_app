import 'package:shared_preferences/shared_preferences.dart';

abstract class IStorageService {
  Future<void> set(String key, String value);
  Future<String?> get(String key);
  Future<void> delete(String key);
}

class StorageService implements IStorageService {
  @override
  Future<void> delete(String key) async {
    final storage = await SharedPreferences.getInstance();
    await storage.remove(key);
  }

  @override
  Future<String?> get(String key) async {
    final storage = await SharedPreferences.getInstance();
    return storage.getString(key);
  }

  @override
  Future<void> set(String key, String value) async {
    final storage = await SharedPreferences.getInstance();
    await storage.setString(key, value);
  }
}
