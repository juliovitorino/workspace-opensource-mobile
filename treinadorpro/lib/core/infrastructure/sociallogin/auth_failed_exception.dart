
class AuthFailedException implements Exception {
  final String message;
  const AuthFailedException(this.message);
  @override
  String toString() => message;
}
