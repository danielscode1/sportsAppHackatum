import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/repositories/auth_repository.dart';
import 'auth_provider.dart';

final authActionsProvider = Provider<AuthActions>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthActions(authRepository);
});

class AuthActions {
  final AuthRepository _authRepository;

  AuthActions(this._authRepository);

  Future<void> signIn(String email, String password) async {
    await _authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signUp(String email, String password, String username) async {
    await _authRepository.signUpWithEmailAndPassword(
      email: email,
      password: password,
      username: username,
    );
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}

