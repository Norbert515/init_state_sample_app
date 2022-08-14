import 'package:flutter_test/flutter_test.dart';
import 'package:sample_app/main.dart' as app;
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App launches', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
  });
}