import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

/// [Returns] a [BuildContext] that is usable for InheritedWidget lookup.
///
/// This works by retrieving the deepest [Element] in the tree. This works really
/// well for looking up [InheritedWidget]s that are located at the top of the widget
/// tree (such as localization or the [Navigator]).
///
/// The actual [Element] returned by this is not defined.
BuildContext debugContext(WidgetTester tester) {
  var allElements = collectAllElementsFrom(tester.binding.renderViewElement!,
      skipOffstage: true);
  var elements = allElements.toList()
    ..sort((e1, e2) {
      return e1.depth.compareTo(e2.depth);
    });
  return elements.last;
}

/// Wraps a widget in a basic [MaterialApp] environment, therefore giving access
/// to basic app features such as localization, navigation etc.
///
/// A [Material] widget is also wrapped to allow usage of material widgets that
/// depend on an ancestor [Material]
///
/// [overrides] allows passing overrides used by [ProviderScope]
Widget basicApp({
  required Widget child,
  List<Override>? overrides,
}) {
  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Material(child: child),
        ),
      ),
      GoRoute(
        path: '/:path',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: Material(
            child: Center(
              child: Text(state.params['path']!),
            ),
          ),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: const Text('404'),
    ),
  );

  return ProviderScope(
    overrides: overrides ?? [],
    child: MaterialApp.router(
      locale: Locale('en'),
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    ),
  );
}

extension BasicAppTester on WidgetTester {
  Future setupBasicApp({
    required Widget child,
    List<Override>? overrides,
  }) async {
    await pumpWidget(basicApp(child: child, overrides: overrides));
    await pumpAndSettle();
  }
}
