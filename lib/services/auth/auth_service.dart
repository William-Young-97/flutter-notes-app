import 'package:notetaker/services/auth/auth_user.dart';
import 'package:notetaker/services/auth/auth_provider.dart';
import 'package:notetaker/services/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;
  const AuthService(this.provider);

  factory AuthService.firebase() {
    return AuthService(
      FirebaseAuthProvider(),
    );
  }

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) {
    return provider.createUser(
      email: email,
      password: password,
    );
  }

  @override
  AuthUser? get currentUser {
    return provider.currentUser;
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) {
    return provider.logIn(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logOut() {
    return provider.logOut();
  }

  @override
  Future<void> sendEmailVerification() {
    return provider.sendEmailVerification();
  }

  @override
  Future<void> initialize() {
    return provider.initialize();
  }

  @override
  Future<void> sendPasswordReset({required String toEmail}) {
    return provider.sendPasswordReset(toEmail: toEmail);
  }
}
