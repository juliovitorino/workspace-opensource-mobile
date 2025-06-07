abstract class IRemoteDatasource<R,T> {
  Future<R> fetchById(T id);
}