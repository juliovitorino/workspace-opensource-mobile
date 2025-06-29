abstract class Repository<R,T> {
  Future<R> findById(String token, T id);
  Future<R> findByUUID(String token, String id);
}