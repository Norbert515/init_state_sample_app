import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_app/navigation/router.dart';
import 'package:sample_app/utils/navigation_refresh.dart';

/// Provider for the [InitStateSampleAppRouter] instance
///
/// If the app should instead use a mocked version, this is the provider
/// to override.
final routerProvider = Provider((ref) {
  return InitStateSampleAppRouter(
    navigationChangeNotifier: ref.watch(navigationChangeProvider),
  );
});
