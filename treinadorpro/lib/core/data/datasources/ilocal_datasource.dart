abstract class ILocalDatasource<R,T> {
  Future<R?> fetchById(T id);
  Future<void> cache(R r);

}