import 'package:localstorage/localstorage.dart';

abstract class IStorageService {
  Future<void> set(String key, String value);
  Future<String?> get(String key);
  Future<void> delete(String key);
}

class StorageService implements IStorageService {
  final LocalStorage _storage = LocalStorage('sofia_app');

  @override
  Future<void> delete(String key) async {
    await _storage.deleteItem(key);
  }

  @override
  Future<String?> get(String key) async {
    return await _storage.getItem(key);
  }

  @override
  Future<void> set(String key, String value) {
    return _storage.setItem(key, value);
  }
}
