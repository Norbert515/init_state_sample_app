import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/modules/authentication/state/authentication_state_notifier.dart';

final navigationChangeProvider = Provider<NavigationChangeNotifier>((ref) {
  return NavigationChangeNotifier()
    ..refreshOnStateNotifier(
        ref.read(authenticationStateNotifierProvider.notifier));
});

/// A change notifier to trigger navigation refreshes.
///
/// This allows to potentially redirect the user when an in-app even occurs.
///
/// This notifier is _only_ here to indicate _something_ changed. The actual
/// logic in response to the state has to be implemented by the GoRouter pages.
class NavigationChangeNotifier with ChangeNotifier {
  var _isAuthenticated = false;

  bool get isAuthenticated {
    return _isAuthenticated;
  }

  final List<RemoveListener> _removeListeners = [];

  void refreshNavigation() => this.notifyListeners();

  void refreshOnStateNotifier(
      StateNotifier<AuthenticationState> stateNotifier) {
    _removeListeners.add(stateNotifier.addListener((authState) {
      _isAuthenticated = authState.isAuthenticated;
      refreshNavigation();
    }));
  }

  @override
  void dispose() {
    _removeListeners.forEach((e) {
      e();
    });
    super.dispose();
  }
}
