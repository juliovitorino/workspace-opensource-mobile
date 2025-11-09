// Exceções internas para semântica clara
class AuthCanceledException implements Exception {
  final String message;
  const AuthCanceledException(this.message);
  @override
  String toString() => message;
}
