abstract class IRemoteDatasource<R,T> {
  Future<R> fetchById(String token, T id);
  Future<R> fetchByUUID(String token, String id);
}