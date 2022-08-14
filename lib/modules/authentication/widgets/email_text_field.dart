import 'package:flutter/material.dart';
import 'package:sample_app/utils/s.dart';

/// A TextField for emails
class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.onChanged,
    this.errorMessage,
  }) : super(key: key);

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputAction textInputAction;

  /// An error message to display with the [TextField]
  ///
  /// This can be null, in this case no error is shown
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      autocorrect: false,
      decoration: InputDecoration(
        errorText: errorMessage,
        hintText: S.of(context).emailHint,
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: textInputAction,
    );
  }
}
