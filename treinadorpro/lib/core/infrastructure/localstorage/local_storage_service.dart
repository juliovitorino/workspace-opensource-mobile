abstract class ILocalStorageService<T> {

  Future<void> save(T object);

  Future<List<T>> getAll();

  Future<T?> getById(int id);

  Future<void> delete(int id);

}