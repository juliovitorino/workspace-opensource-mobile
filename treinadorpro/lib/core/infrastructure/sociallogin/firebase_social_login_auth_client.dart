import 'dart:io' show Platform;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'auth_canceled_exception.dart';
import 'auth_failed_exception.dart';
import 'credential_model.dart';
import 'isocial_login_auth_client.dart';


class FirebaseSocialLoginAuthClient implements ISocialLoginAuthClient {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  FirebaseSocialLoginAuthClient({
    FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })
      : _auth = firebaseAuth ?? FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn();

  @override
  Future<CredentialModel> signInWithGoogle() async {
    try {
      // //forçar a abertura da janela de contas google
      await _googleSignIn.signOut();

      // 1) Usuário escolhe a conta Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // Usuário cancelou
        throw const AuthCanceledException('Google Sign-In canceled by user');
      }

      // 2) Recupera tokens do Google
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final String? idToken = googleAuth.idToken;
      final String? accessToken = googleAuth.accessToken;

      if (idToken == null) {
        // Sem idToken não autenticamos no Firebase
        throw const AuthFailedException('Missing Google idToken');
      }

      // 3) Cria credential p/ Firebase e faz login
      final credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      await _auth.signInWithCredential(credential);

      // 4) Mapeia para seu modelo
      return CredentialModel(
        provider: SocialProvider.google,
        idToken: idToken,
        accessToken: accessToken,
        authorizationCode: null,
        nonce: null,
        codeVerifier: null,
        redirectUri: null,
      );
    } on AuthCanceledException {
      rethrow; // Propague para camada superior tratar "usuário cancelou"
    } on FirebaseAuthException catch (e) {
      throw AuthFailedException('FirebaseAuthException: ${e.code} - ${e.message}');
    } catch (e) {
      throw AuthFailedException('Unknown error on Google Sign-In: $e');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      // Importante: saia do Firebase e do GoogleSignIn
      await Future.wait([
        _auth.signOut(),
        _googleSignIn.signOut(),
      ]);
    } catch (_) {
      // Pode ignorar ou logar
    }
  }
}

