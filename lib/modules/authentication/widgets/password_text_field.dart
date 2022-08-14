import 'package:flutter/material.dart';
import 'package:sample_app/utils/s.dart';

/// A [TextField] that lets the user input a password
///
/// This also allows showing and hiding the input
class PasswordTextField extends StatefulWidget {
  /// Constructor for the normal [PasswordTextField]
  const PasswordTextField({
    Key? key,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.onChanged,
    this.errorMessage,
  })  : _isRepeat = false,
        super(key: key);

  /// Constructor for [PasswordTextField] when the TextField should be a
  /// 'repeat password'.
  ///
  /// This is used so the user has to type the password twice to ensure that it
  /// is memorized/ saved.
  ///
  /// The only change this does is to change the label of the [TextField]
  const PasswordTextField.repeat({
    Key? key,
    this.textInputAction = TextInputAction.next,
    this.controller,
    this.onChanged,
    this.errorMessage,
  })  : _isRepeat = true,
        super(key: key);

  final TextInputAction textInputAction;

  final TextEditingController? controller;

  final ValueChanged<String>? onChanged;

  /// An error message to display with the [TextField]
  ///
  /// This can be null, in this case no error is shown
  final String? errorMessage;

  /// Whether this is used as a repeat [PasswordTextField]
  final bool _isRepeat;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool passwordHidden = true;
  late bool _hasText;

  @override
  void initState() {
    super.initState();
    _hasText = widget.controller?.text.isNotEmpty?? false;

    widget.controller?.addListener(() {
      setState(() {
        _hasText = widget.controller!.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      autocorrect: false,
      decoration: InputDecoration(
          errorText: widget.errorMessage,
          hintText: widget._isRepeat
              ? S.of(context).passwordRepeatHint
              : S.of(context).passwordHint,
          suffixIcon: _hasText
              ? IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  icon: Icon(
                      passwordHidden ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      passwordHidden = !passwordHidden;
                    });
                  },
                )
              : const SizedBox()),
      obscureText: passwordHidden,
      textInputAction: widget.textInputAction,
    );
  }
}
