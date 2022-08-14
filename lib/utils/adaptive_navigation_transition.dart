import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A page generator that returns pages corresponding to the current platform.
///
/// In particular, this ensures that web and desktop based platforms don't use the
/// same animations for page transitions as mobile devices do.
class AdaptivePage {
  static Page<void> page({required Widget child, LocalKey? key}) {
    if(kIsWeb) {
      return _NoTransitionPage(child: child, key: key);
    }
    if (Platform.isAndroid) {
      return MaterialPage<void>(child: child, key: key);
    } else if (Platform.isIOS) {
      return CupertinoPage<void>(child: child, key: key);
    }

    return _NoTransitionPage<void>(child: child, key: key);
  }
}

/// A page transition that doesn't animate
class _NoTransitionPage<T> extends CustomTransitionPage<T> {
  _NoTransitionPage({required super.child, super.key})
      : super(
            transitionsBuilder:
                (context, animation, secondaryAnimation, widget) => widget);
}
