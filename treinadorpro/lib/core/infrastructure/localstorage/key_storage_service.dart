abstract class KeyStorageService<T> {
  Future<void> save(T objectSave, String key);

  Future<T?> get(String key);

  Future<void> clear(String key);
}
