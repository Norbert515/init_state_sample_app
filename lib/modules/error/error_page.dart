import 'package:flutter/material.dart';
import 'package:sample_app/style/typography.dart';
import 'package:sample_app/utils/s.dart';


/// A versatile error page.
///
/// Handles different error routers that can occure in the app
class ErrorPage extends StatelessWidget {

  /// An error page that is shown if a route cannot be found
  ///
  /// This is most commonly needed in the web where users can freely navigate
  /// to any route using the URL.
  /// But only other mobile and desktop devices this can also occur if for example
  /// a deeplink is wrongly configured or some code pushes a wrong page.
  ErrorPage.locationNotFound({super.key, required this.location});

  final String location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '404',
                style: MyTypography.h1,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Text(
                S.of(context).pageNotFound(location),
                style: MyTypography.body,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
