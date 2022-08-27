import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sample_app/navigation/router_provider.dart';
import 'package:sample_app/style/colors.dart';
import 'package:sample_app/style/text_theme_builder.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: _MyAppContent(),
    );
  }
}

/// Distinction between [MyApp] and [_MyAppContent] is made
/// so it is easy to access Riverpod related things

class _MyAppContent extends ConsumerWidget {
  const _MyAppContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _router = ref.read(routerProvider).implementation;

    var myColors = ref.watch(myColorProvider);
    return MaterialApp.router(
      title: 'sample_app',
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
      routerDelegate: _router.routerDelegate,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: TextThemeBuilder.build(myColors),
    );
  }
}
