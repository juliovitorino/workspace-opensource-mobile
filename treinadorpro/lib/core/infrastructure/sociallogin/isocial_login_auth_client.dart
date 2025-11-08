
import 'credential_model.dart';

abstract class ISocialLoginAuthClient {
  Future<CredentialModel> signInWithGoogle();
  Future<void> signOut();
}
