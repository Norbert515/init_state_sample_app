import 'package:sample_app/modules/authentication/utils/form_width.dart';
import 'package:flutter/material.dart';

/// Constraints the width of the [widget]
///
/// This is used in the form pages to not allow the TextFields to stretch across
/// the screen.
class FormConstraints extends StatelessWidget {
  const FormConstraints({Key? key, required this.child,}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: FormWidth.maxFormWidth,
          ),
          child: child,
        ),
      ),
    );
  }
}
