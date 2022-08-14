import 'package:flutter/material.dart';
import 'package:sample_app/utils/s.dart';

/// Displays information that the user should look at their
/// email.
class CheckEmailPageContent extends StatelessWidget {
  const CheckEmailPageContent({Key? key, required this.email})
      : super(key: key);

  /// The mail address the mail was sent to
  final String email;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Icon(
              Icons.email_outlined,
              size: 48,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.of(context).checkYourMail,
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
                Text(
                  S.of(context).checkYourMailDescription(email),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
