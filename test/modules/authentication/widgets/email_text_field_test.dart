import 'package:sample_app/modules/authentication/widgets/email_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/common.dart';

void main() {
  testWidgets('Email TextField shows error parameter',
      (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: EmailTextField(
        controller: TextEditingController(),
        errorMessage: 'My Error',
      ),
    );
    await tester.pumpAndSettle();

    expect(find.text('My Error'), findsOneWidget);
  });
}
