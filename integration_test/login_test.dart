import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sample_app/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Login Works', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    await tester.enterText(
        find.widgetWithText(TextField, 'Email'), 'kozsir.norbert@gmail.com');
    await tester.pump();

    await tester.enterText(
        find.widgetWithText(TextField, 'Password'), 'Test123!');
    await tester.pump();
  }, skip: Platform.isWindows);
}
