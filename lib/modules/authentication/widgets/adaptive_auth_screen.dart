import 'package:flutter/material.dart';
import 'package:sample_app/utils/breakpoints.dart';

/// On desktop screen sizes, this will show [child] and [optionalChild]
/// side by side in a [Row], each widgets taking up halve the screen.
///
/// In smaller devices, only [child] is shown
class AdaptiveAuthScreen extends StatelessWidget {
  const AdaptiveAuthScreen({
    Key? key,
    required this.child,
    required this.optionalChild,
  }) : super(key: key);

  final Widget child;
  final Widget optionalChild;

  @override
  Widget build(BuildContext context) {
    if (Breakpoints.isLg(context)) {
      return Row(
        children: [
          Expanded(child: child),
          Expanded(child: optionalChild),
        ],
      );
    }

    return child;
  }
}
