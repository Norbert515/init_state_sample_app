import 'package:sample_app/modules/authentication/widgets/password_requirements_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/common.dart';

void main() {
  // The actual password matching algorithm is tested in more detail
  // in utils/password_validator.dart
  testWidgets('Empty password fails every requirement',
      (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: PasswordRequirementsDisplay(password: ''),
    );
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.check), findsNothing);
    expect(find.byIcon(Icons.clear), findsNWidgets(5));
  });

  testWidgets('Strong password fulfills every requirement',
      (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: PasswordRequirementsDisplay(password: 'Strong!Password000'),
    );

    expect(find.byIcon(Icons.clear), findsNothing);
    expect(find.byIcon(Icons.check), findsNWidgets(5));
  });
}
