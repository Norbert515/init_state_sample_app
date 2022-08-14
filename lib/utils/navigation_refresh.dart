import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final navigationChangeProvider = Provider<NavigationChangeNotifier>((ref) {
  return NavigationChangeNotifier();
});

/// A change notifier to trigger navigation refreshes.
///
/// This allows to potentially redirect the user when an in-app even occurs.
///
/// This notifier is _only_ here to indicate _something_ changed. The actual
/// logic in response to the state has to be implemented by the GoRouter pages.
class NavigationChangeNotifier extends ChangeNotifier {

  final List<RemoveListener> _removeListeners = [];

  void refreshNavigation() => this.notifyListeners();

  void refreshOnStateNotifier(StateNotifier stateNotifier) {
    _removeListeners.add(stateNotifier.addListener((_) {
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
