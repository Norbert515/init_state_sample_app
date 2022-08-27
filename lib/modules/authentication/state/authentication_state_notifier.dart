import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'firebase_auth_provider.dart';

part 'authentication_state_notifier.freezed.dart';

/// Convenient provider to read whether the user is authenticated
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authenticationStateNotifierProvider).isAuthenticated;
});

/// Convenient provider to read the user ID
///
/// The user id is null if nobody is authenticated
final userIdProvider = Provider<String?>((ref) {
  return ref
      .watch(authenticationStateNotifierProvider)
      .map(authenticated: (auth) => auth.userId, unauthenticated: (_) => null);
});

/// Provider to access the [AuthenticationStateNotifier]
final authenticationStateNotifierProvider =
    StateNotifierProvider<AuthenticationStateNotifier, AuthenticationState>(
        (ref) {
  return AuthenticationStateNotifier(ref.read(firebaseAuthProvider));
});

@freezed
class AuthenticationState with _$AuthenticationState {
  const AuthenticationState._();

  /// This only holds the user ID as user management is done in a separate module
  const factory AuthenticationState.authenticated(String userId) =
      AuthenticationAuthenticated;
  const factory AuthenticationState.unauthenticated() =
      AuthenticationUnauthenticated;

  bool get isAuthenticated {
    return map(authenticated: (_) => true, unauthenticated: (_) => false);
  }
}

/// Wrapper around [FirebaseAuth]
///
/// Abstracts away firebase in a [StateNotifier] that can be read synchronously in
/// the app but also listened to.
class AuthenticationStateNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationStateNotifier(this.firebaseAuth)
      : super(AuthenticationState.unauthenticated()) {
    _updateStateWithUser(firebaseAuth.currentUser);
    _authSubscription = firebaseAuth.userChanges().listen((user) {
      _updateStateWithUser(user);
    });
  }

  late StreamSubscription _authSubscription;
  final auth.FirebaseAuth firebaseAuth;

  void logout() async {
    try {
      await firebaseAuth.signOut();
      state = AuthenticationState.unauthenticated();
    } catch (e) {
      // As per firebase documentation this shouldn't throw anything specific
      // In the case it throws, just rethrow so we preserve the error.
      rethrow;
    }
  }

  void _updateStateWithUser(auth.User? user) {
    if (user == null) {
      state = AuthenticationState.unauthenticated();
    } else {
      state = AuthenticationState.authenticated(user.uid);
    }
  }

  @override
  void dispose() {
    _authSubscription.cancel();
    super.dispose();
  }
}
