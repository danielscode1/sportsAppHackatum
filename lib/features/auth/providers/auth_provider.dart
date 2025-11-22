import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../common/repositories/auth_repository.dart';
import '../../../common/models/user_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

final authStateProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
});

final currentUserProvider = StreamProvider<UserModel?>((ref) {
  final authState = ref.watch(authStateProvider);
  final authRepository = ref.watch(authRepositoryProvider);

  return authState.when(
    data: (user) {
      if (user == null) return Stream.value(null);
      return Stream.fromFuture(authRepository.getUserData(user.uid));
    },
    loading: () => Stream.value(null),
    error: (_, __) => Stream.value(null),
  );
});

final themeModeProvider = StateNotifierProvider<ThemeModeNotifier, ThemeMode>((ref) {
  return ThemeModeNotifier(ref);
});

class ThemeModeNotifier extends StateNotifier<ThemeMode> {
  final Ref ref;

  ThemeModeNotifier(this.ref) : super(ThemeMode.system) {
    _loadThemeMode();
  }

  Future<void> _loadThemeMode() async {
    final authState = ref.read(authStateProvider);
    authState.whenData((user) async {
      if (user != null) {
        final userData = await ref.read(authRepositoryProvider).getUserData(user.uid);
        if (userData?.darkMode == true) {
          state = ThemeMode.dark;
        } else if (userData?.darkMode == false) {
          state = ThemeMode.light;
        }
      }
    });
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    final authState = ref.read(authStateProvider);
    authState.whenData((user) async {
      if (user != null) {
        final authRepo = ref.read(authRepositoryProvider);
        final userData = await authRepo.getUserData(user.uid);
        if (userData != null) {
          await authRepo.updateUserData(
            userData.copyWith(darkMode: mode == ThemeMode.dark),
          );
        }
      }
    });
  }
}

