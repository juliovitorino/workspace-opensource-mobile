abstract class StorageService<T> {
  Future<void> save(T objectSave);

  Future<T?> get();

  Future<void> clear();
}
