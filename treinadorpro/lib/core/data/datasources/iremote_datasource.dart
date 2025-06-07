abstract class IRemoteDatasource<R,T> {
  Future<R> fetchById(T id);
  Future<R> fetchByUUID(String id);
}