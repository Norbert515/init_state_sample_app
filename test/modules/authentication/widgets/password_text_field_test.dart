import 'package:sample_app/modules/authentication/widgets/password_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_app/utils/s.dart';

import '../../../utils/common.dart';

void main() {

  testWidgets('Shows passwordHint text', (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: PasswordTextField(
        controller: TextEditingController(),
      ),
    );

    expect(find.text(S.of(debugContext(tester)).passwordHint), findsOneWidget);
  });

  testWidgets('Shows passwordRepeatHint text', (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: PasswordTextField.repeat(
        controller: TextEditingController(),
      ),
    );

    expect(find.text(S.of(debugContext(tester)).passwordRepeatHint), findsOneWidget);
  });


  testWidgets('Cannot show password if no text is inside', (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: PasswordTextField(
        controller: TextEditingController(),
      ),
    );

    expect(find.byType(IconButton), findsNothing);
  });

  testWidgets('Text is not readable by default', (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: PasswordTextField(
        controller: TextEditingController(text: 'MyPassword'),
      ),
    );

    expect(find.byWidgetPredicate((e) => e is TextField && e.obscureText == false) , findsNothing);
  });

  testWidgets('Toggling visibility shows text', (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: PasswordTextField(
        controller: TextEditingController(text: 'MyPassword'),
      ),
    );
    await tester.tap(find.byType(IconButton));
    await tester.pump();

    expect(find.byWidgetPredicate((e) => e is TextField && e.obscureText == false) , findsOneWidget);
  });

  testWidgets('Toggling visibility can hide text again', (WidgetTester tester) async {
    await tester.setupBasicApp(
      child: PasswordTextField(
        controller: TextEditingController(text: 'MyPassword'),
      ),
    );

    // Show
    await tester.tap(find.byType(IconButton));
    await tester.pump();

    // Hide
    await tester.tap(find.byType(IconButton));
    await tester.pump();

    expect(find.byWidgetPredicate((e) => e is TextField && e.obscureText == false) , findsNothing);
  });

  testWidgets('Changing text with controller also updates visibility toggle', (WidgetTester tester) async {

    var controller = TextEditingController(text: 'MyPassword');

    await tester.setupBasicApp(
      child: PasswordTextField(
        controller: controller,
      ),
    );

    expect(find.byType(IconButton), findsOneWidget);

    controller.text = '';
    await tester.pump();

    expect(find.byType(IconButton), findsNothing);
  });
}
