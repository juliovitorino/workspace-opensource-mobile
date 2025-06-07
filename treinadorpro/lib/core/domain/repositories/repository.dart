abstract class Repository<R,T> {
  Future<R> findById(T id);
  Future<R> findByUUID(String id);
}